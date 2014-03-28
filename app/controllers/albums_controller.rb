class AlbumsController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :topic, shallow: true
  actions :all, except: :index
  respond_to :html, :js

  before_action do
    @current_menu_item = :topic
  end

  def create
    create! do |success, failure|
      failure.js { render action: 'new' }
    end
  end

  def upload_pictures
    @lesson = Album.new permitted_params[:album]
    @lesson.upload!
    respond_to do |format|
      format.js { render action: 'new' }
    end
  end

  private

  def permitted_params
    params.permit album: [:title, files: [], pictures_attributes: [:file_cache]]
  end
end
