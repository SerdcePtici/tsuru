class PictureController < ApplicationController
  def upload
    authorize! :upload, Picture
    @picturable = params[:picturable_type].constantize.new #TODO check type
    file = params[:picturable][:files].first
    @picturable.pictures.build file: file
    #TODO check if proper file uploaded
  end
end
