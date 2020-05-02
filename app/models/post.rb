class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :product
  belongs_to :maker
  has_many :comments
end
