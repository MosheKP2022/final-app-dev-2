require "application_system_test_case"

class OfferingsTest < ApplicationSystemTestCase
  setup do
    @offering = offerings(:one)
  end

  test "visiting the index" do
    visit offerings_url
    assert_selector "h1", text: "Offerings"
  end

  test "creating a Offering" do
    visit offerings_url
    click_on "New Offering"

    fill_in "Address", with: @offering.address
    fill_in "Comments count", with: @offering.comments_count
    fill_in "Date", with: @offering.date
    fill_in "Description", with: @offering.description
    fill_in "Image", with: @offering.image
    fill_in "Labeled offerings count", with: @offering.labeled_offerings_count
    fill_in "Max age", with: @offering.max_age
    fill_in "Min age", with: @offering.min_age
    fill_in "Price", with: @offering.price
    fill_in "Saves count", with: @offering.saves_count
    fill_in "Seller", with: @offering.seller_id
    fill_in "Status", with: @offering.status
    fill_in "Time", with: @offering.time
    fill_in "Title", with: @offering.title
    fill_in "Video", with: @offering.video
    click_on "Create Offering"

    assert_text "Offering was successfully created"
    click_on "Back"
  end

  test "updating a Offering" do
    visit offerings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @offering.address
    fill_in "Comments count", with: @offering.comments_count
    fill_in "Date", with: @offering.date
    fill_in "Description", with: @offering.description
    fill_in "Image", with: @offering.image
    fill_in "Labeled offerings count", with: @offering.labeled_offerings_count
    fill_in "Max age", with: @offering.max_age
    fill_in "Min age", with: @offering.min_age
    fill_in "Price", with: @offering.price
    fill_in "Saves count", with: @offering.saves_count
    fill_in "Seller", with: @offering.seller_id
    fill_in "Status", with: @offering.status
    fill_in "Time", with: @offering.time
    fill_in "Title", with: @offering.title
    fill_in "Video", with: @offering.video
    click_on "Update Offering"

    assert_text "Offering was successfully updated"
    click_on "Back"
  end

  test "destroying a Offering" do
    visit offerings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Offering was successfully destroyed"
  end
end
