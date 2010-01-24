class BillingCode < ActiveRecord::Base
  has_and_belongs_to_many :related,
    :join_table => 'related_billing_codes',
    :foreign_key => 'first_billing_code_id',
    :association_foreign_key => 'second_billing_code_id',
    :class_name => 'BillingCode',
    :insert_sql => 'INSERT INTO related_billing_codes (`first_billing_code_id`, `second_billing_code_id`)
                    VALUES (#{id}, #{record.id}),(#{record.id}, #{id})' do
      
      def associate(record)
        insert_record(record)
        @target << record
      end
    end                
end
