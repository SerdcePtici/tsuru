class LessonsController < ApplicationController
  inherit_resources
  include Concerns::AlbumsController
  load_and_authorize_resource

  before_action do
    @current_menu_item = :lessons
  end

  private

  def permitted_params
    params.permit lesson: [:title, files: [], pictures_attributes: [:file_cache]]
  end
end
