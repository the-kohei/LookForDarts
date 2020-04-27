class Product < ApplicationRecord
  belongs_to :maker
  belongs_to :category
  belongs_to :post

end
