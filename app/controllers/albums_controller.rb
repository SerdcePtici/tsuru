class AlbumsController < InheritedResources::Base
  include Concerns::AlbumsController
  load_and_authorize_resource
  belongs_to :topic, shallow: true
  actions :all, except: :index

  before_action do
    @current_menu_item = :topic
  end

  def upload_pictures
    authorize! :create, Album
    @album = Album.new permitted_params[:album]
    @album.upload!
    respond_to do |format|
      format.js { render action: 'new' }
    end
  end

  private

  def permitted_params
    params.permit album: [:title, files: [], pictures_attributes: [:file_cache]]
  end
end
