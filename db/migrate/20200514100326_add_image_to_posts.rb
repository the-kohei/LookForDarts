class AddImageToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :image, :string, null: false
  end
end
