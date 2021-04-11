class Kid < ApplicationRecord
  belongs_to :house
  belongs_to :user
  has_rich_text :additional_info
end
