class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  belongs_to :product
end
