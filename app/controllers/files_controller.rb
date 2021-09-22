class FilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @files = current_user.attachments
  end

  def new
    @file = current_user.attachments.new
  end

  def create
    @file = current_user.attachments.new(attachment_params)
    @file.attachment_type = 'Private'
    if @file.save
      flash[:info] = "File Created Successfully."
      redirect_to files_path
    else
      @file = current_user.attachments.new
      render 'new'
    end
  end

  def tag
    @file = current_user.attachments.find_by_id(params[:file_id])
    @tags = Tag.all
  end

  def add_tags
    @file = current_user.attachments.find_by_id(params[:file_id])
    params[:tags].each do |tag_id|
      tag = Tag.find(tag_id)
      @file.attachment_tags.create(tag: tag)
    end
    flash[:info] = "Added Tag Successfully."
    redirect_to files_path
  end

  def download_file
    @file = Attachment.find(params[:file_id])
    send_file(@file.document.path,
          :filename =>File.basename(@file.document.path),
          :type => @file.document.content_type,
          :disposition => 'attachment',
          :url_based_filename => true)
  end

  private


  def attachment_params
    params.require(:attachment).permit(:title, :description, :document)
  end
end