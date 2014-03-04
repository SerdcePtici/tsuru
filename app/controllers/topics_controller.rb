class TopicsController < InheritedResources::Base
  load_and_authorize_resource

  private

  def permitted_params
    params.permit(topic: [:title])
  end
end