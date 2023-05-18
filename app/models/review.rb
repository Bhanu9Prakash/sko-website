class Review < ApplicationRecord
  belongs_to :user
  has_rich_text :volunteers_present
  has_rich_text :description
  
end
