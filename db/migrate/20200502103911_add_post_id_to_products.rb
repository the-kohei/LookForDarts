class AddPostIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :post, foreign_key: true
  end
end
