class PictureController < ApplicationController
  def upload
    authorize! :upload, Picture
    @picturable = Lesson.new
    file = params[:picturable][:files].first
    @picturable.pictures.build file: file
  end
end
