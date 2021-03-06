# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_billboard
  before_action :authenticate_user!

  def create
    @comment = @billboard.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @comment = @billboard.comments.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :billboard_id)
  end

  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end
end
