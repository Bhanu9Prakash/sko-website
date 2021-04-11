class Discussion < ApplicationRecord
  has_rich_text :description
  validates :title, presence: true
  validates :description, presence: true
  has_many :comments, as: :commentable
  belongs_to :user
end
