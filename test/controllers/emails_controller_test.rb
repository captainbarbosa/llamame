require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:user_1)
    sign_in @user
    @email = emails(:one)
    @person = people(:one)
  end

  test "should get index" do
    get :index, person_id: @person.id
    assert_response :success
    assert_not_nil assigns(:emails)
  end

  test "should get new" do
    get :new, person_id: @person.id
    assert_response :success
  end

  test "should create email" do
    assert_difference('Email.count') do
      post :create, person_id: @person.id, email: { email: @email.email, emailable_id: @email.emailable_id, emailable_type: @email.emailable_type }
    end

    assert_redirected_to person_path(id: @person.id)
  end

  test "should show email" do
    get :show, id: @email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email
    assert_response :success
  end

  test "should update email" do
    patch :update, id: @email, email: { email: @email.email, emailable_id: @email.emailable_id, emailable_type: @email.emailable_type }
    assert_redirected_to email_path(assigns(:email))
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete :destroy, id: @email
    end

    assert_redirected_to emails_path
  end
end
