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
        cattr_accessor :seedrable_columns
        self.seedrable_columns = options[:columns] || self.column_names - ['id', 'created_at', 'updated_at']
      end
      
      # helper method seed.  discovers each column_type in seedrable_columns and
      # calls Seedr accordingly fill the model
      def seed
        seeded = self.new
        seeded.seedrable_columns.each do |col_name|
          col_name = col_name.to_s
          type = self.columns_hash[col_name].type.to_s
          seeded.send("#{col_name}=",Seedr.send("#{type}"))
        end
        seeded
      end
    end
  end
end

ActiveRecord::Base.send :include, Seedr::ActsAsSeedrable