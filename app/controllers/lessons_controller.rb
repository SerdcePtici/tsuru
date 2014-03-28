class LessonsController < InheritedResources::Base
  include Concerns::AlbumsController
  load_and_authorize_resource

  before_action do
    @current_menu_item = :lessons
  end

  def upload_pictures
    authorize! :create, Lesson
    @lesson = Lesson.new permitted_params[:lesson]
    @lesson.upload!
    respond_to do |format|
      format.js { render action: 'new' }
    end
  end

  private

  def permitted_params
    params.permit lesson: [:title, files: [], pictures_attributes: [:file_cache]]
  end
end
