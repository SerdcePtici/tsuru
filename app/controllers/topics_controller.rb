class TopicsController < InheritedResources::Base
  load_and_authorize_resource

  before_action do
    @current_menu_item = :topic
  end

  private

  def permitted_params
    params.permit(topic: [:title])
  end
end