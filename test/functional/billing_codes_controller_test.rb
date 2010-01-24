require File.dirname(__FILE__) + '/../test_helper'
require 'billing_codes_controller'

# Re-raise errors caught by the controller.
class BillingCodesController; def rescue_action(e) raise e end; end

class BillingCodesControllerTest < ActiveSupport::TestCase
  fixtures :clients, :billing_codes

  def setup
    @controller = BillingCodesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index, :client_id => 1
    assert_response :success
    assert assigns(:billing_codes)
  end

  def test_should_get_new
    get :new, :client_id => 1
    assert_response :success
  end
  
  def test_should_create_billing_code
    old_count = BillingCode.count
    post :create, :billing_code => { }, :client_id => 1
    assert_equal old_count+1, BillingCode.count
    
    assert_redirected_to billing_code_path(clients(:one), assigns(:billing_code))
  end

  def test_should_show_billing_code
    get :show, :id => 1, :client_id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1, :client_id => 1
    assert_response :success
  end
  
  def test_should_update_billing_code
    put :update, :id => 1, :billing_code => { }, :client_id => 1
    assert_redirected_to billing_code_path(clients(:one), assigns(:billing_code))
  end
  
  def test_should_destroy_billing_code
    old_count = BillingCode.count
    delete :destroy, :id => 1, :client_id => 1
    assert_equal old_count-1, BillingCode.count
    
    assert_redirected_to billing_codes_path
  end
end
