require "application_system_test_case"

class LabeledOfferingsTest < ApplicationSystemTestCase
  setup do
    @labeled_offering = labeled_offerings(:one)
  end

  test "visiting the index" do
    visit labeled_offerings_url
    assert_selector "h1", text: "Labeled Offerings"
  end

  test "creating a Labeled offering" do
    visit labeled_offerings_url
    click_on "New Labeled Offering"

    fill_in "Offering", with: @labeled_offering.offering_id
    fill_in "Tag", with: @labeled_offering.tag_id
    click_on "Create Labeled offering"

    assert_text "Labeled offering was successfully created"
    click_on "Back"
  end

  test "updating a Labeled offering" do
    visit labeled_offerings_url
    click_on "Edit", match: :first

    fill_in "Offering", with: @labeled_offering.offering_id
    fill_in "Tag", with: @labeled_offering.tag_id
    click_on "Update Labeled offering"

    assert_text "Labeled offering was successfully updated"
    click_on "Back"
  end

  test "destroying a Labeled offering" do
    visit labeled_offerings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Labeled offering was successfully destroyed"
  end
end
