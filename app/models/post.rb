class Post < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy

end
