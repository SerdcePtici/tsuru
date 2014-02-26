class StoriesController < ApplicationController
  inherit_resources

  def index
    @stories = Story.where magic: (params[:magic] == 'true')
    respond_with @stories do |format|
      format.html { render :index_magic if params[:magic] }
    end
  end

  def new
    @story = Story.new
    2.times { @story.pictures.build }
  end

  def create
    @story = Story.new permitted_params
    missing_pictures_num = 2 - @story.pictures.count
    missing_pictures_num.times { @story.pictures.build }
    create!
  end

  private

  def permitted_params
    params.require(:story).permit(:author, :title, :magic, :text, pictures_attributes: [:file, :file_cache])
  end
end
