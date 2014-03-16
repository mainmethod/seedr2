module Seedr
  module ActsAsSeedrable
    extend ActiveSupport::Concern
    
    included do
      
    end
    
    module ClassMethods
      # define main acts_as_seedrable method
      # options = array of column names.  if not present, seedrable_columns becomes
      #           all columns minus the defaults
      def acts_as_seedrable(options={})
        # define instance and class attribute: seedrable_columns
        cattr_accessor :seedrable_columns
        # set seedrable columns to options columns value, or the model's columns that make sense to seed
        self.seedrable_columns = options[:columns] || self.column_names - ['id', 'created_at', 'updated_at']
      end
      
      # helper method seed.  discovers each column_type in seedrable_columns and
      # calls Seedr accordingly fill the model
      def seed
        # create instance of seedrable class
        seeded = self.new
        
        seeded.seedrable_columns.each do |col_name|
          col_name = col_name.to_s
          type = self.columns_hash[col_name].type.to_s
          # use column name to set seedrable class' attribute to corresponding Seedr type method
          seeded.send("#{col_name}=",Seedr.send("#{type}"))
        end
        seeded
      end
    end
  end
end

# attach to ActiveRecord::Base
ActiveRecord::Base.send :include, Seedr::ActsAsSeedrable