class Maker < ApplicationRecord
  has_many :products
  belongs_to :post
end
