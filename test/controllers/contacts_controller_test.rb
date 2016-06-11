require File.expand_path('../../test_helper', __FILE__)

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
    @filter_1 = filters(:one)
    @filter_2 = filters(:two)
    @filter_3 = filters(:three)
    @filter_4 = filters(:four)
    @filter_5 = filters(:five)
    @filter_6 = filters(:six)
    @filter_7 = filters(:seven)
    @filter_8 = filters(:eight)
    @filter_9 = filters(:nine)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { age: @contact.age, mail: @contact.mail, name: @contact.name, role: @contact.role, state: @contact.state }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { age: @contact.age, mail: @contact.mail, name: @contact.name, role: @contact.role, state: @contact.state }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end

  # testa busca por nome like 'ohn' => filter 1
  test "should search filter 1 like" do
    get :search, filter_id: @filter_1.id
    assert_response :success
  end

  # testa busca por role equals 'Developer' => filter 2
  test "should search filter 2 equals" do
    get :search, filter_id: @filter_2.id
    assert_response :success
  end

  # testa busca por mail starts_with 'Jo' => filter 3
  test "should search filter 3 starts with" do
    get :search, filter_id: @filter_3.id
    assert_response :success
  end

  # testa busca por state ends_with 'C' => filter 4
  test "should search filter 4 ends with" do
    get :search, filter_id: @filter_4.id
    assert_response :success
  end

  # testa busca por age lesser 20 => filter 5
  test "should search filter 5 lesser" do
    get :search, filter_id: @filter_5.id
    assert_response :success
  end


  # testa busca por age lesser_equals 10 => filter 6
  test "should search filter 6 lesser equals" do
    get :search, filter_id: @filter_6.id
    assert_response :success
  end

  # testa busca por age greater 8 => filter 7
  test "should search filter 7 greater" do
    get :search, filter_id: @filter_7.id
    assert_response :success
  end

  # testa busca por age greater_equals 10 => filter 8
  test "should search filter 8 greater equals" do
    get :search, filter_id: @filter_8.id
    assert_response :success
  end

  # testa busca por age equals 20 => filter 9
  test "should search filter 9 equals" do
    get :search, filter_id: @filter_9.id
    assert_response :success
  end
end
