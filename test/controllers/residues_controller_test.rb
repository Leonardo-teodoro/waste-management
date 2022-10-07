require "test_helper"

class ResiduesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @residue = residues(:one)
  end

  test "should get index" do
    get residues_url
    assert_response :success
  end

  test "should get new" do
    get new_residue_url
    assert_response :success
  end

  test "should create residue" do
    assert_difference("Residue.count") do
      post residues_url, params: { residue: { buttonContent: @residue.buttonContent, content: @residue.content, description: @residue.description, link: @residue.link, slug: @residue.slug, subtitle: @residue.subtitle, title: @residue.title } }
    end

    assert_redirected_to residue_url(Residue.last)
  end

  test "should show residue" do
    get residue_url(@residue)
    assert_response :success
  end

  test "should get edit" do
    get edit_residue_url(@residue)
    assert_response :success
  end

  test "should update residue" do
    patch residue_url(@residue), params: { residue: { buttonContent: @residue.buttonContent, content: @residue.content, description: @residue.description, link: @residue.link, slug: @residue.slug, subtitle: @residue.subtitle, title: @residue.title } }
    assert_redirected_to residue_url(@residue)
  end

  test "should destroy residue" do
    assert_difference("Residue.count", -1) do
      delete residue_url(@residue)
    end

    assert_redirected_to residues_url
  end
end
