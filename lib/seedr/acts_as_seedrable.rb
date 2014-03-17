module Seedr
  module ActsAsSeedrable
    extend ActiveSupport::Concern
    
    included do
      
    end
    
    module ClassMethods
      # define main acts_as_seedrable method
      # options = array of column names.  all is default.  accepts :except, :only, and :columns as arrays of symbols
      def acts_as_seedrable(options={})
        # set seedrable columns to options columns value, or the model's columns that make sense to seed
        excluded_columns    = [:created_at, :updated_at]
        excluded_columns    |= options[:except] if options[:except]
        all_columns         = options[:only] || self.column_names.map(&:to_sym)
        columns             = (all_columns - excluded_columns).map(&:to_s)
        @seedrable_columns  = columns.delete_if {|c| c=='id' || c.end_with?('_id')}
      end
      
      # helper method seed.  discovers each column_type in seedrable_columns and
      # calls Seedr accordingly fill the model
      def seed
        # create instance of seedrable class
        seeded = self.new
        
        @seedrable_columns.each do |col_name|
          type = self.columns_hash[col_name].type.to_s
          # use column name to set seedrable class' attribute to corresponding Seedr type method
          seeded.send("#{col_name}=", send_to_seedr(type,col_name))
        end
        seeded
      end
      
      private
      
      def send_to_seedr(type,column_name)
        column_name = column_name.underscore
        if ['fname','f_name','first_name','firstname'].include? column_name
          return Seedr.first_name
        elsif ['lname','l_name','last_name','lastname'].include? column_name
          return Seedr.last_name
        elsif ['full_name','fullname'].include? column_name
          return Seedr.full_name
        elsif ['email','email_address','emailaddress','email_add','emailadd'].include? column_name
          return Seedr.email
        elsif ['username','user_name'].include? column_name
          return Seedr.username
        elsif ['m_name','middle_initial','m_initial'].include? column_name
          return Seedr.middle_initial
        elsif ['phone','phonenumber','phone_number'].include? column_name
          return Seedr.phone_number
        elsif ['company','companyname','company_name'].include? column_name
          return Seedr.company_name
        else
          return Seedr.send("#{type}")
        end
      end
    end
  end
end

# attach to ActiveRecord::Base
ActiveSupport.on_load(:active_record) do
  include Seedr::ActsAsSeedrable
end
