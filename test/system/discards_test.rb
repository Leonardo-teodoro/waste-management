require "application_system_test_case"

class DiscardsTest < ApplicationSystemTestCase
  setup do
    @discard = discards(:one)
  end

  test "visiting the index" do
    visit discards_url
    assert_selector "h1", text: "Discards"
  end

  test "should create discard" do
    visit discards_url
    click_on "New discard"

    fill_in "Date", with: @discard.date
    fill_in "Description", with: @discard.description
    click_on "Create Discard"

    assert_text "Discard was successfully created"
    click_on "Back"
  end

  test "should update Discard" do
    visit discard_url(@discard)
    click_on "Edit this discard", match: :first

    fill_in "Date", with: @discard.date
    fill_in "Description", with: @discard.description
    click_on "Update Discard"

    assert_text "Discard was successfully updated"
    click_on "Back"
  end

  test "should destroy Discard" do
    visit discard_url(@discard)
    click_on "Destroy this discard", match: :first

    assert_text "Discard was successfully destroyed"
  end
end
