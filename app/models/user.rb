class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :verify_file_type
  has_one_attached :user_icon

  def verify_file_type
    return unless user_icon.attached?
    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]
    errors.add(:user_icon, '使える画像はjpg, jpeg, gif, pngのみです') unless allowed_file_types.include?(user_icon.blob.content_type)
  end
end
