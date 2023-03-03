# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  def set_commentable
    @commentable = Report.find_by(id: params[:report_id])
  end

  def render_commentable_show
    @report = @commentable
    render 'reports/show'
  end
end
