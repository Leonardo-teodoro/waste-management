require "application_system_test_case"

class ReceiversTest < ApplicationSystemTestCase
  setup do
    @receiver = receivers(:one)
  end

  test "visiting the index" do
    visit receivers_url
    assert_selector "h1", text: "Receivers"
  end

  test "should create receiver" do
    visit receivers_url
    click_on "New receiver"

    check "Approved" if @receiver.approved
    fill_in "Cep", with: @receiver.cep
    fill_in "City", with: @receiver.city
    fill_in "Complement", with: @receiver.complement
    check "Condition" if @receiver.condition
    fill_in "Email", with: @receiver.email
    fill_in "Link", with: @receiver.link
    fill_in "Name", with: @receiver.name
    fill_in "Number", with: @receiver.number
    fill_in "State", with: @receiver.state
    fill_in "Street", with: @receiver.street
    check "Truly linfo" if @receiver.truly_linfo
    click_on "Create Receiver"

    assert_text "Receiver was successfully created"
    click_on "Back"
  end

  test "should update Receiver" do
    visit receiver_url(@receiver)
    click_on "Edit this receiver", match: :first

    check "Approved" if @receiver.approved
    fill_in "Cep", with: @receiver.cep
    fill_in "City", with: @receiver.city
    fill_in "Complement", with: @receiver.complement
    check "Condition" if @receiver.condition
    fill_in "Email", with: @receiver.email
    fill_in "Link", with: @receiver.link
    fill_in "Name", with: @receiver.name
    fill_in "Number", with: @receiver.number
    fill_in "State", with: @receiver.state
    fill_in "Street", with: @receiver.street
    check "Truly linfo" if @receiver.truly_linfo
    click_on "Update Receiver"

    assert_text "Receiver was successfully updated"
    click_on "Back"
  end

  test "should destroy Receiver" do
    visit receiver_url(@receiver)
    click_on "Destroy this receiver", match: :first

    assert_text "Receiver was successfully destroyed"
  end
end
