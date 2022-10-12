require "application_system_test_case"

class TechnicalsTest < ApplicationSystemTestCase
  setup do
    @technical = technicals(:one)
  end

  test "visiting the index" do
    visit technicals_url
    assert_selector "h1", text: "Technicals"
  end

  test "should create technical" do
    visit technicals_url
    click_on "New technical"

    fill_in "User", with: @technical.user_id
    click_on "Create Technical"

    assert_text "Technical was successfully created"
    click_on "Back"
  end

  test "should update Technical" do
    visit technical_url(@technical)
    click_on "Edit this technical", match: :first

    fill_in "User", with: @technical.user_id
    click_on "Update Technical"

    assert_text "Technical was successfully updated"
    click_on "Back"
  end

  test "should destroy Technical" do
    visit technical_url(@technical)
    click_on "Destroy this technical", match: :first

    assert_text "Technical was successfully destroyed"
  end
end
