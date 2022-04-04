class Category < ApplicationRecord

  has_many :post_images, dependent: :destroy
  validates :name, presence: true
end
