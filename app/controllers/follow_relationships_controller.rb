# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  before_action :set_user

  def create
    follower = User.find_by(params[:follower_id])
    current_user.follow(params[:user_id]) if follower
    redirect_to user_path(@user)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
