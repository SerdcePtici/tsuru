class AlbumsController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :topic, shallow: true
  actions :all, except: :index

  before_action do
    @current_menu_item = :topic
  end

  def index
    @lessons = @lessons.where(lesson: false)
  end

  private

  def permitted_params
    params.permit album: [:title, files: [], pictures_attributes: [:file_cache]]
  end
end
