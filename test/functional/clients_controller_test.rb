require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  fixtures :clients

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:clients)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_client
    old_count = Client.count
    post :create, :client => { :name => 'Zorg' }
    assert_equal old_count+1, Client.count
    assert_redirected_to client_path(assigns(:client))
  end

  def test_should_show_client
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_client
    put :update, :id => 1, :client => { }
    assert_redirected_to client_path(assigns(:client))
  end

  def test_should_destroy_client
    old_count = Client.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Client.count
    assert_redirected_to clients_path
  end
end
