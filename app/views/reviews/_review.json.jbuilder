json.extract! review, :id, :review_type, :date, :volunteers_present, :description, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)
json.volunteers_present review.volunteers_present.to_s
json.description review.description.to_s
