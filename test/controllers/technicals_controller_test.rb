require "test_helper"

class TechnicalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @technical = technicals(:one)
  end

  test "should get index" do
    get technicals_url
    assert_response :success
  end

  test "should get new" do
    get new_technical_url
    assert_response :success
  end

  test "should create technical" do
    assert_difference("Technical.count") do
      post technicals_url, params: { technical: { user_id: @technical.user_id } }
    end

    assert_redirected_to technical_url(Technical.last)
  end

  test "should show technical" do
    get technical_url(@technical)
    assert_response :success
  end

  test "should get edit" do
    get edit_technical_url(@technical)
    assert_response :success
  end

  test "should update technical" do
    patch technical_url(@technical), params: { technical: { user_id: @technical.user_id } }
    assert_redirected_to technical_url(@technical)
  end

  test "should destroy technical" do
    assert_difference("Technical.count", -1) do
      delete technical_url(@technical)
    end

    assert_redirected_to technicals_url
  end
end
