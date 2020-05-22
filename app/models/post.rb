class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :image, :text, :maker_id, :category_id, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :maker
  has_many :comments,foreign_key: :post_id, dependent: :destroy
  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%").or(Post.where('title LIKE(?)', "%#{search}%"))
  end
end
