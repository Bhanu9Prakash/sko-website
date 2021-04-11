json.extract! house, :id, :house_number, :contact_number, :source_of_income, :number_of_people_employed, :living_since, :average_income, :documents, :user_id, :created_at, :updated_at
json.url house_url(house, format: :json)
json.documents house.documents.to_s
