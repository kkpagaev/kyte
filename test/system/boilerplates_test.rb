require "application_system_test_case"

class BoilerplatesTest < ApplicationSystemTestCase
  setup do
    @boilerplate = boilerplates(:one)
  end

  test "visiting the index" do
    visit boilerplates_url
    assert_selector "h1", text: "Boilerplates"
  end

  test "should create boilerplate" do
    visit boilerplates_url
    click_on "New boilerplate"

    fill_in "Git link", with: @boilerplate.git_link
    fill_in "Name", with: @boilerplate.name
    click_on "Create Boilerplate"

    assert_text "Boilerplate was successfully created"
    click_on "Back"
  end

  test "should update Boilerplate" do
    visit boilerplate_url(@boilerplate)
    click_on "Edit this boilerplate", match: :first

    fill_in "Git link", with: @boilerplate.git_link
    fill_in "Name", with: @boilerplate.name
    click_on "Update Boilerplate"

    assert_text "Boilerplate was successfully updated"
    click_on "Back"
  end

  test "should destroy Boilerplate" do
    visit boilerplate_url(@boilerplate)
    click_on "Destroy this boilerplate", match: :first

    assert_text "Boilerplate was successfully destroyed"
  end
end
