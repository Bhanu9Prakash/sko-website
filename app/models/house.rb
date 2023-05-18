class House < ApplicationRecord
  has_many :members, inverse_of: :house, dependent: :delete_all
  accepts_nested_attributes_for :members, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
  has_rich_text :documents
  has_many :kids
end
