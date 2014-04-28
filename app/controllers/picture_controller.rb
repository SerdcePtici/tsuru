class PictureController < ApplicationController
  def upload
    authorize! :upload, Picture

    picturable_type = params[:picturable_type].constantize
    unless picturable_type < Picturable
      render nothing: true, status: :bad_request
      return
    end

    @picturable = picturable_type.new
    if @picturable.multiple_pictures?
      @picturable.pictures.build file: params[:picturable][:files].first
    else
      @picturable.build_picture file: params[:picturable][:files]
    end
    #TODO check if proper file uploaded
  end
end
