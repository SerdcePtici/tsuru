class AlbumsController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :topic, shallow: true
  actions :all, except: :index

  def permitted_params
    params.permit(album: [:title])
  end
end
