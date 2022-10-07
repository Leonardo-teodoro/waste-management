require "application_system_test_case"

class ResiduesTest < ApplicationSystemTestCase
  setup do
    @residue = residues(:one)
  end

  test "visiting the index" do
    visit residues_url
    assert_selector "h1", text: "Residues"
  end

  test "should create residue" do
    visit residues_url
    click_on "New residue"

    fill_in "Buttoncontent", with: @residue.buttonContent
    fill_in "Content", with: @residue.content
    fill_in "Description", with: @residue.description
    fill_in "Link", with: @residue.link
    fill_in "Slug", with: @residue.slug
    fill_in "Subtitle", with: @residue.subtitle
    fill_in "Title", with: @residue.title
    click_on "Create Residue"

    assert_text "Residue was successfully created"
    click_on "Back"
  end

  test "should update Residue" do
    visit residue_url(@residue)
    click_on "Edit this residue", match: :first

    fill_in "Buttoncontent", with: @residue.buttonContent
    fill_in "Content", with: @residue.content
    fill_in "Description", with: @residue.description
    fill_in "Link", with: @residue.link
    fill_in "Slug", with: @residue.slug
    fill_in "Subtitle", with: @residue.subtitle
    fill_in "Title", with: @residue.title
    click_on "Update Residue"

    assert_text "Residue was successfully updated"
    click_on "Back"
  end

  test "should destroy Residue" do
    visit residue_url(@residue)
    click_on "Destroy this residue", match: :first

    assert_text "Residue was successfully destroyed"
  end
end
