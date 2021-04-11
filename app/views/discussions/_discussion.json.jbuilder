json.extract! discussion, :id, :title, :description, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
json.description discussion.description.to_s
