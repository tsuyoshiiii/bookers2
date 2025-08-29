class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  attribute :title, :string
  attribute :body, :text
end
