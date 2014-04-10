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
    begin
      @album = Album.find params[:id]
      @album.assign_attributes permitted_params[:album]
    rescue ActiveRecord::RecordNotFound
      @album = Album.new permitted_params[:album]
    end
    @album.upload!
    if @album.new_record?
      respond_to do |format|
        format.js { render :new }
      end
    end
  end

  def update
    update! do |success, failure|
      success.js { redirect_via_turbolinks_to @album }
    end
  end

  private

  def permitted_params
    if action_name.in? %w[create upload_pictures]
      params.permit album: [:title, files: [], pictures_attributes: [:file_cache]]
    else
      params.permit album: [files: [], pictures_attributes: [:file_cache]]
    end
  end

end
