class AddMakerIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :maker, foreign_key: true
  end
end
