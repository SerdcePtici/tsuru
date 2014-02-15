class StoriesController < ApplicationController
  inherit_resources

  def index
    @stories = Story.where(magic: (params[:magic] == 'true') )
    respond_with @stories do |format|
      format.html { render :index_magic if params[:magic] }
    end
  end

  private

  def permitted_params
    params.permit(story: [:author, :title, :magic, :text])
  end
end
