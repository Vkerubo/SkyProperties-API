require "test_helper"

class BuyersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buyer = buyers(:one)
  end

  test "should get index" do
    get buyers_url, as: :json
    assert_response :success
  end

  test "should create buyer" do
    assert_difference("Buyer.count") do
      post buyers_url, params: { buyer: { email: @buyer.email, name: @buyer.name, phone: @buyer.phone } }, as: :json
    end

    assert_response :created
  end

  test "should show buyer" do
    get buyer_url(@buyer), as: :json
    assert_response :success
  end

  test "should update buyer" do
    patch buyer_url(@buyer), params: { buyer: { email: @buyer.email, name: @buyer.name, phone: @buyer.phone } }, as: :json
    assert_response :success
  end

  test "should destroy buyer" do
    assert_difference("Buyer.count", -1) do
      delete buyer_url(@buyer), as: :json
    end

    assert_response :no_content
  end
end
