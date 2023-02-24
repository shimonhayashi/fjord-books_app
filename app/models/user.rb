# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :following_relationships, class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :follower_relationships, class_name: 'FollowRelationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed

  has_many :followings, through: :following_relationships, source: :followed
  has_many :followers, through: :follower_relationships, source: :follower

  def follow(user)
    following_relationships.new(followed: user).save
  end

  def unfollow(user)
    following_relationships.find_by(followed: user)&.destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
