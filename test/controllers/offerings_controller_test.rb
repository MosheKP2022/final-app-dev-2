require "test_helper"

class OfferingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offering = offerings(:one)
  end

  test "should get index" do
    get offerings_url
    assert_response :success
  end

  test "should get new" do
    get new_offering_url
    assert_response :success
  end

  test "should create offering" do
    assert_difference('Offering.count') do
      post offerings_url, params: { offering: { address: @offering.address, comments_count: @offering.comments_count, date: @offering.date, description: @offering.description, image: @offering.image, labeled_offerings_count: @offering.labeled_offerings_count, max_age: @offering.max_age, min_age: @offering.min_age, price: @offering.price, saves_count: @offering.saves_count, seller_id: @offering.seller_id, status: @offering.status, time: @offering.time, title: @offering.title, video: @offering.video } }
    end

    assert_redirected_to offering_url(Offering.last)
  end

  test "should show offering" do
    get offering_url(@offering)
    assert_response :success
  end

  test "should get edit" do
    get edit_offering_url(@offering)
    assert_response :success
  end

  test "should update offering" do
    patch offering_url(@offering), params: { offering: { address: @offering.address, comments_count: @offering.comments_count, date: @offering.date, description: @offering.description, image: @offering.image, labeled_offerings_count: @offering.labeled_offerings_count, max_age: @offering.max_age, min_age: @offering.min_age, price: @offering.price, saves_count: @offering.saves_count, seller_id: @offering.seller_id, status: @offering.status, time: @offering.time, title: @offering.title, video: @offering.video } }
    assert_redirected_to offering_url(@offering)
  end

  test "should destroy offering" do
    assert_difference('Offering.count', -1) do
      delete offering_url(@offering)
    end

    assert_redirected_to offerings_url
  end
end
