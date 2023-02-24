# frozen_string_literal: true

class FollowRelationshipsController < ApplicationController
  def create
    if current_user.follow(params[:user_id]).save
      set_user
      redirect_to user_path(@user), notice: 'フォローをしました'
    else
      redirect_to users_path, alert: 'フォローに失敗しました'
    end
  end

  def destroy
    if current_user.unfollow(params[:user_id])
      set_user
      redirect_to user_path(@user), notice: 'フォローを解除しました'
    else
      redirect_to users_path, alert: 'フォローの解除に失敗しました'
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
