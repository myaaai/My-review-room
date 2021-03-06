class Category < ApplicationRecord

  has_many :post_images, dependent: :destroy
  validates :name, presence: true
  belongs_to :user

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpeg', content_type: 'image/jpeg')
    end
    image
  end

  def get_profile_image(size)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize: size).processed
  end
end
