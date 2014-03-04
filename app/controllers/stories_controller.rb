class StoriesController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  before_action do
    @current_menu_item = params[:magic] ? :magic : :history
  end

  def index
    @stories = @stories.where magic: (params[:magic] == 'true')
    respond_with @stories do |format|
      format.html { render :index_magic if params[:magic] }
    end
  end

  def new
    Story::MAX_PICTURES_COUNT.times { @story.pictures.build }
  end

  def create
    create! do |success, failure|
      failure.html do
        missing_pictures_num = Story::MAX_PICTURES_COUNT - @story.pictures.count
        missing_pictures_num.times { @story.pictures.build }
        render :new
      end
    end
  end

  private

  def permitted_params
    params.permit(story: [:author, :title, :magic, :text, pictures_attributes: [:file, :file_cache]])
  end
end
