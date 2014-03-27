class LessonsController < InheritedResources::Base
  load_and_authorize_resource
  respond_to :html, :js

  before_action do
    @current_menu_item = :lessons
  end

  def create
    create! do |success, failure|
      failure.js { render action: 'new' }
    end
  end

  def upload_pictures
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
