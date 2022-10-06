require "test_helper"

class ReceiversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receiver = receivers(:one)
  end

  test "should get index" do
    get receivers_url
    assert_response :success
  end

  test "should get new" do
    get new_receiver_url
    assert_response :success
  end

  test "should create receiver" do
    assert_difference("Receiver.count") do
      post receivers_url, params: { receiver: { approved: @receiver.approved, cep: @receiver.cep, city: @receiver.city, complement: @receiver.complement, condition: @receiver.condition, email: @receiver.email, link: @receiver.link, name: @receiver.name, number: @receiver.number, state: @receiver.state, street: @receiver.street, truly_linfo: @receiver.truly_linfo } }
    end

    assert_redirected_to receiver_url(Receiver.last)
  end

  test "should show receiver" do
    get receiver_url(@receiver)
    assert_response :success
  end

  test "should get edit" do
    get edit_receiver_url(@receiver)
    assert_response :success
  end

  test "should update receiver" do
    patch receiver_url(@receiver), params: { receiver: { approved: @receiver.approved, cep: @receiver.cep, city: @receiver.city, complement: @receiver.complement, condition: @receiver.condition, email: @receiver.email, link: @receiver.link, name: @receiver.name, number: @receiver.number, state: @receiver.state, street: @receiver.street, truly_linfo: @receiver.truly_linfo } }
    assert_redirected_to receiver_url(@receiver)
  end

  test "should destroy receiver" do
    assert_difference("Receiver.count", -1) do
      delete receiver_url(@receiver)
    end

    assert_redirected_to receivers_url
  end
end
