class AlbumsController < InheritedResources::Base
  include Concerns::AlbumsController
  load_and_authorize_resource
  belongs_to :topic, shallow: true
  actions :all, except: %i[index edit]

  before_action do
    @current_menu_item = :topic
  end

  private

  def permitted_params
    if action_name == 'create'
      params.permit album: [:title, files: [], pictures_attributes: [:file_cache, :file]]
    else
      params.permit album: [files: [], pictures_attributes: [:file_cache, :file]]
    end
  end

end
