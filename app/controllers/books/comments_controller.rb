# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable

  def set_commentable
    @commentable = Book.find_by(id: params[:book_id])
  end

  def render_commentable_show
    @book = @commentable
    render 'books/show'
  end
end
