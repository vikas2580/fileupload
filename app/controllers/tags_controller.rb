class TagsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tag = Tag.find(params[:id])
    @files = @tag.attachments.where(user_id: current_user.id)
  end
end