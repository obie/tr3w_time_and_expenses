require 'test_helper'

class BillingCodeTest < ActiveSupport::TestCase
  fixtures :billing_codes

  def test_self_referential_bidirectional_habtm_association
    billing_codes(:travel).related << billing_codes(:development)    
    assert BillingCode.find(1).related.include?(BillingCode.find(2))
    assert BillingCode.find(2).related.include?(BillingCode.find(1))
  end

  def test_that_deletion_is_bidirectional_too
    billing_codes(:travel).related << billing_codes(:development) 
    billing_codes(:travel).related.delete(billing_codes(:development))    
    assert !BillingCode.find(1).related.include?(BillingCode.find(2))

    # Perhaps needs a dependent option?
    # assert !BillingCode.find(2).related.include?(BillingCode.find(1))
  end

  def test_associate_extension_works
    billing_codes(:travel).related.associate(billing_codes(:development))
    assert BillingCode.find(1).related.include?(BillingCode.find(2))
  end

end
