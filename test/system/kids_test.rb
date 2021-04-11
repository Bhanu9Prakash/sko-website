require "application_system_test_case"

class KidsTest < ApplicationSystemTestCase
  setup do
    @kid = kids(:one)
  end

  test "visiting the index" do
    visit kids_url
    assert_selector "h1", text: "Kids"
  end

  test "creating a Kid" do
    visit kids_url
    click_on "New Kid"

    fill_in "Age", with: @kid.age
    fill_in "Annual income", with: @kid.annual_income
    fill_in "Caste", with: @kid.caste
    fill_in "Current standard", with: @kid.current_standard
    fill_in "Extra curriculars", with: @kid.extra_curriculars
    fill_in "Father name", with: @kid.father_name
    fill_in "Father occupation", with: @kid.father_occupation
    fill_in "Home address", with: @kid.home_address
    fill_in "House", with: @kid.house_id
    fill_in "Medium", with: @kid.medium
    fill_in "Mobile", with: @kid.mobile
    fill_in "Mother name", with: @kid.mother_name
    fill_in "Mother occupation", with: @kid.mother_occupation
    fill_in "Name", with: @kid.name
    fill_in "Personality trait", with: @kid.personality_trait
    fill_in "Remarks", with: @kid.remarks
    fill_in "School", with: @kid.school
    fill_in "User", with: @kid.user_id
    click_on "Create Kid"

    assert_text "Kid was successfully created"
    click_on "Back"
  end

  test "updating a Kid" do
    visit kids_url
    click_on "Edit", match: :first

    fill_in "Age", with: @kid.age
    fill_in "Annual income", with: @kid.annual_income
    fill_in "Caste", with: @kid.caste
    fill_in "Current standard", with: @kid.current_standard
    fill_in "Extra curriculars", with: @kid.extra_curriculars
    fill_in "Father name", with: @kid.father_name
    fill_in "Father occupation", with: @kid.father_occupation
    fill_in "Home address", with: @kid.home_address
    fill_in "House", with: @kid.house_id
    fill_in "Medium", with: @kid.medium
    fill_in "Mobile", with: @kid.mobile
    fill_in "Mother name", with: @kid.mother_name
    fill_in "Mother occupation", with: @kid.mother_occupation
    fill_in "Name", with: @kid.name
    fill_in "Personality trait", with: @kid.personality_trait
    fill_in "Remarks", with: @kid.remarks
    fill_in "School", with: @kid.school
    fill_in "User", with: @kid.user_id
    click_on "Update Kid"

    assert_text "Kid was successfully updated"
    click_on "Back"
  end

  test "destroying a Kid" do
    visit kids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kid was successfully destroyed"
  end
end
