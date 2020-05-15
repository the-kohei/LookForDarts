class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  belongs_to :user
  belongs_to :category
  belongs_to :maker
  has_many :comments
  def self.search(search)
    return Post.all unless search
    Post.where('text LIKE(?)', "%#{search}%").or(Post.where('title LIKE(?)', "%#{search}%"))
  end
end
