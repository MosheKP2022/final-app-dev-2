require "test_helper"

class LabeledOfferingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @labeled_offering = labeled_offerings(:one)
  end

  test "should get index" do
    get labeled_offerings_url
    assert_response :success
  end

  test "should get new" do
    get new_labeled_offering_url
    assert_response :success
  end

  test "should create labeled_offering" do
    assert_difference('LabeledOffering.count') do
      post labeled_offerings_url, params: { labeled_offering: { offering_id: @labeled_offering.offering_id, tag_id: @labeled_offering.tag_id } }
    end

    assert_redirected_to labeled_offering_url(LabeledOffering.last)
  end

  test "should show labeled_offering" do
    get labeled_offering_url(@labeled_offering)
    assert_response :success
  end

  test "should get edit" do
    get edit_labeled_offering_url(@labeled_offering)
    assert_response :success
  end

  test "should update labeled_offering" do
    patch labeled_offering_url(@labeled_offering), params: { labeled_offering: { offering_id: @labeled_offering.offering_id, tag_id: @labeled_offering.tag_id } }
    assert_redirected_to labeled_offering_url(@labeled_offering)
  end

  test "should destroy labeled_offering" do
    assert_difference('LabeledOffering.count', -1) do
      delete labeled_offering_url(@labeled_offering)
    end

    assert_redirected_to labeled_offerings_url
  end
end
