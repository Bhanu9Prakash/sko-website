require "application_system_test_case"

class HousesTest < ApplicationSystemTestCase
  setup do
    @house = houses(:one)
  end

  test "visiting the index" do
    visit houses_url
    assert_selector "h1", text: "Houses"
  end

  test "creating a House" do
    visit houses_url
    click_on "New House"

    fill_in "Average income", with: @house.average_income
    fill_in "Contact number", with: @house.contact_number
    fill_in "House number", with: @house.house_number
    fill_in "Living since", with: @house.living_since
    fill_in "Number of people employed", with: @house.number_of_people_employed
    fill_in "Source of income", with: @house.source_of_income
    fill_in "User", with: @house.user_id
    click_on "Create House"

    assert_text "House was successfully created"
    click_on "Back"
  end

  test "updating a House" do
    visit houses_url
    click_on "Edit", match: :first

    fill_in "Average income", with: @house.average_income
    fill_in "Contact number", with: @house.contact_number
    fill_in "House number", with: @house.house_number
    fill_in "Living since", with: @house.living_since
    fill_in "Number of people employed", with: @house.number_of_people_employed
    fill_in "Source of income", with: @house.source_of_income
    fill_in "User", with: @house.user_id
    click_on "Update House"

    assert_text "House was successfully updated"
    click_on "Back"
  end

  test "destroying a House" do
    visit houses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "House was successfully destroyed"
  end
end
