require "test_helper"

class KidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kid = kids(:one)
  end

  test "should get index" do
    get kids_url
    assert_response :success
  end

  test "should get new" do
    get new_kid_url
    assert_response :success
  end

  test "should create kid" do
    assert_difference('Kid.count') do
      post kids_url, params: { kid: { age: @kid.age, annual_income: @kid.annual_income, caste: @kid.caste, current_standard: @kid.current_standard, extra_curriculars: @kid.extra_curriculars, father_name: @kid.father_name, father_occupation: @kid.father_occupation, home_address: @kid.home_address, house_id: @kid.house_id, medium: @kid.medium, mobile: @kid.mobile, mother_name: @kid.mother_name, mother_occupation: @kid.mother_occupation, name: @kid.name, personality_trait: @kid.personality_trait, remarks: @kid.remarks, school: @kid.school, user_id: @kid.user_id } }
    end

    assert_redirected_to kid_url(Kid.last)
  end

  test "should show kid" do
    get kid_url(@kid)
    assert_response :success
  end

  test "should get edit" do
    get edit_kid_url(@kid)
    assert_response :success
  end

  test "should update kid" do
    patch kid_url(@kid), params: { kid: { age: @kid.age, annual_income: @kid.annual_income, caste: @kid.caste, current_standard: @kid.current_standard, extra_curriculars: @kid.extra_curriculars, father_name: @kid.father_name, father_occupation: @kid.father_occupation, home_address: @kid.home_address, house_id: @kid.house_id, medium: @kid.medium, mobile: @kid.mobile, mother_name: @kid.mother_name, mother_occupation: @kid.mother_occupation, name: @kid.name, personality_trait: @kid.personality_trait, remarks: @kid.remarks, school: @kid.school, user_id: @kid.user_id } }
    assert_redirected_to kid_url(@kid)
  end

  test "should destroy kid" do
    assert_difference('Kid.count', -1) do
      delete kid_url(@kid)
    end

    assert_redirected_to kids_url
  end
end
