json.extract! kid, :id, :name, :age, :current_standard, :school, :medium, :home_address, :mobile, :caste, :father_name, :father_occupation, :mother_name, :mother_occupation, :annual_income, :extra_curriculars, :personality_trait, :remarks, :additional_info, :house_id, :user_id, :created_at, :updated_at
json.url kid_url(kid, format: :json)
json.additional_info kid.additional_info.to_s
