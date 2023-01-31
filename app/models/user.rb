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

  has_many :following_relationships, class_name: "FollowRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :follower_relationships, class_name: "FollowRelationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :following_relationships, source: :followed
  has_many :followers, through: :follower_relationships, source: :follower

  def follow(user_id)
    following_relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
