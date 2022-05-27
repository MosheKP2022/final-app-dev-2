require "application_system_test_case"

class ContactUsMessagesTest < ApplicationSystemTestCase
  setup do
    @contact_us_message = contact_us_messages(:one)
  end

  test "visiting the index" do
    visit contact_us_messages_url
    assert_selector "h1", text: "Contact Us Messages"
  end

  test "creating a Contact us message" do
    visit contact_us_messages_url
    click_on "New Contact Us Message"

    fill_in "Body", with: @contact_us_message.body
    fill_in "Title", with: @contact_us_message.title
    fill_in "User", with: @contact_us_message.user_id
    click_on "Create Contact us message"

    assert_text "Contact us message was successfully created"
    click_on "Back"
  end

  test "updating a Contact us message" do
    visit contact_us_messages_url
    click_on "Edit", match: :first

    fill_in "Body", with: @contact_us_message.body
    fill_in "Title", with: @contact_us_message.title
    fill_in "User", with: @contact_us_message.user_id
    click_on "Update Contact us message"

    assert_text "Contact us message was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact us message" do
    visit contact_us_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact us message was successfully destroyed"
  end
end
