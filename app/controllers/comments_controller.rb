# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def destroy
    if @comment&.destroy
      redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to root_path, alert: 'コメントの削除に失敗しました'
    end
  end

  def create
    if @commentable.nil?
      redirect_to root_path, alert: 'コメントの作成に失敗しました'
    else
      @comment = @commentable.comments.new(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
      else
        @comments = @commentable.comments
        render_commentable_show
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end
end
