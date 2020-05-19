class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, foreign_key: :comment_id,dependent: :destroy
end
