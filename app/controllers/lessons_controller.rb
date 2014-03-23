class LessonsController < InheritedResources::Base
  load_and_authorize_resource class: Album, instance_name: :lesson
  defaults resource_class: Album

  before_action do
    @current_menu_item = :lessons
  end

  before_action :load_lesson, only: :show

  def index
    @lessons = @lessons.where(lesson: true)
  end

  def create
    @lesson = Album.new permitted_params[:lesson]
    @lesson.lesson = true
    create!
  end

  private

  def load_lesson
    Album.where(lesson: true).find(params[:id])
  end

  def permitted_params
    params.permit lesson: [:title, files: [], pictures_attributes: [:file_cache]]
  end
end
