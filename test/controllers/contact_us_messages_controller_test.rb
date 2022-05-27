require "test_helper"

class ContactUsMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_us_message = contact_us_messages(:one)
  end

  test "should get index" do
    get contact_us_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_us_message_url
    assert_response :success
  end

  test "should create contact_us_message" do
    assert_difference('ContactUsMessage.count') do
      post contact_us_messages_url, params: { contact_us_message: { body: @contact_us_message.body, title: @contact_us_message.title, user_id: @contact_us_message.user_id } }
    end

    assert_redirected_to contact_us_message_url(ContactUsMessage.last)
  end

  test "should show contact_us_message" do
    get contact_us_message_url(@contact_us_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_us_message_url(@contact_us_message)
    assert_response :success
  end

  test "should update contact_us_message" do
    patch contact_us_message_url(@contact_us_message), params: { contact_us_message: { body: @contact_us_message.body, title: @contact_us_message.title, user_id: @contact_us_message.user_id } }
    assert_redirected_to contact_us_message_url(@contact_us_message)
  end

  test "should destroy contact_us_message" do
    assert_difference('ContactUsMessage.count', -1) do
      delete contact_us_message_url(@contact_us_message)
    end

    assert_redirected_to contact_us_messages_url
  end
end
