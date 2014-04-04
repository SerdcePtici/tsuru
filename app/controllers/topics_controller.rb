class TopicsController < InheritedResources::Base
  load_and_authorize_resource

  before_action do
    @current_menu_item = :topic
  end

  def create
    create! do |success, failure|
      success.js { redirect_via_turbolinks_to @topic }
    end
  end

  private

  def permitted_params
    params.permit(topic: [:title])
  end
end