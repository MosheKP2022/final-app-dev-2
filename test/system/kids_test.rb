require "application_system_test_case"

class KidsTest < ApplicationSystemTestCase
  setup do
    @kid = kids(:one)
  end

  test "visiting the index" do
    visit kids_url
    assert_selector "h1", text: "Kids"
  end

  test "creating a Kid" do
    visit kids_url
    click_on "New Kid"

    fill_in "About me", with: @kid.about_me
    fill_in "Dob", with: @kid.dob
    fill_in "Family members count", with: @kid.family_members_count
    fill_in "First name", with: @kid.first_name
    fill_in "Last name", with: @kid.last_name
    fill_in "School", with: @kid.school
    click_on "Create Kid"

    assert_text "Kid was successfully created"
    click_on "Back"
  end

  test "updating a Kid" do
    visit kids_url
    click_on "Edit", match: :first

    fill_in "About me", with: @kid.about_me
    fill_in "Dob", with: @kid.dob
    fill_in "Family members count", with: @kid.family_members_count
    fill_in "First name", with: @kid.first_name
    fill_in "Last name", with: @kid.last_name
    fill_in "School", with: @kid.school
    click_on "Update Kid"

    assert_text "Kid was successfully updated"
    click_on "Back"
  end

  test "destroying a Kid" do
    visit kids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kid was successfully destroyed"
  end
end
