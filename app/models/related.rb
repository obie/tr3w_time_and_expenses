class Related < ActiveRecord::Base
  
  set_table_name :related_billing_codes
  
  belongs_to :foo, :class_name => 'BillingCode', :foreign_key => 'source_billing_code_id'
  belongs_to :bar, :class_name => 'BillingCode', :foreign_key => 'target_billing_code_id' 
end
