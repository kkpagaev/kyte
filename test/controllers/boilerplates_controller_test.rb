require "test_helper"

class BoilerplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boilerplate = boilerplates(:one)
  end

  test "should get index" do
    get boilerplates_url
    assert_response :success
  end

  test "should get new" do
    get new_boilerplate_url
    assert_response :success
  end

  test "should create boilerplate" do
    assert_difference("Boilerplate.count") do
      post boilerplates_url, params: { boilerplate: { git_link: @boilerplate.git_link, name: @boilerplate.name } }
    end

    assert_redirected_to boilerplate_url(Boilerplate.last)
  end

  test "should show boilerplate" do
    get boilerplate_url(@boilerplate)
    assert_response :success
  end

  test "should get edit" do
    get edit_boilerplate_url(@boilerplate)
    assert_response :success
  end

  test "should update boilerplate" do
    patch boilerplate_url(@boilerplate), params: { boilerplate: { git_link: @boilerplate.git_link, name: @boilerplate.name } }
    assert_redirected_to boilerplate_url(@boilerplate)
  end

  test "should destroy boilerplate" do
    assert_difference("Boilerplate.count", -1) do
      delete boilerplate_url(@boilerplate)
    end

    assert_redirected_to boilerplates_url
  end
end
