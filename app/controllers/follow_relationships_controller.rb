# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  def create
    if User.exists?(params[:user_id])
      user = User.find(params[:user_id])
      if current_user.follow(params[:user_id])
        redirect_to user_path(user), notice: 'フォローをしました'
      else
        redirect_to users_path, notice: 'フォローに失敗しました'
      end
    else
      redirect_to users_path, notice: 'フォローに失敗しました'
    end
  end

  def destroy
    if User.exists?(params[:user_id])
      user = User.find(params[:user_id])
      if current_user.unfollow(params[:user_id])
        redirect_to user_path(user), notice: 'フォローを解除しました'
      else
        redirect_to users_path, notice: 'フォローの解除に失敗しました'
      end
    else
      redirect_to users_path, notice: 'フォローの解除に失敗しました'
    end
  end
end
