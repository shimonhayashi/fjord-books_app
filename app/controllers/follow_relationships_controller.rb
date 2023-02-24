# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  before_action :set_user

  def create
    if current_user.follow(@user)
      redirect_to user_path(@user), notice: 'フォローをしました'
    else
      redirect_to users_path, alert: 'フォローに失敗しました'
    end
  end

  def destroy
    if current_user.unfollow(@user)
      redirect_to user_path(@user), notice: 'フォローを解除しました'
    else
      redirect_to users_path, alert: 'フォローの解除に失敗しました'
    end
  end

  def set_user
    @user = User.find(params[:user_id]) if User.exists?(params[:user_id])
  end
end
