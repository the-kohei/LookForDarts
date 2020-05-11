class AddImageToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :image, :string, null: false
  end
end
