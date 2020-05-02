class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :image, null: false
      t.timestamps
    end
  end
end
