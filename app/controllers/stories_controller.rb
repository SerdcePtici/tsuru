class StoriesController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  actions :all, except: %i[edit update]

  before_action do
    @current_menu_item = params[:magic] ? :magic : :history
  end

  def show
    @current_menu_item = @story.magic? ? :magic : :history
  end

  def index
    @stories = @stories.where magic: (params[:magic] == 'true')
    respond_with @stories do |format|
      format.html { render :index_magic if params[:magic] }
    end
  end

  private

  def permitted_params
    params.permit(story: [:author, :title, :magic, :text, pictures_attributes: [:file, :file_cache]])
  end
end
