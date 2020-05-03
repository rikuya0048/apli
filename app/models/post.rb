class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :comments
  mount_uploader :image, ImageUploader

  def self.search(search)
    return Post.all unless search
    Post.where('content LIKE(?)', "%#{search}%")
  end
end
