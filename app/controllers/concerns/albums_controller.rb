module Concerns::AlbumsController
  extend ActiveSupport::Concern

  included do
    respond_to :html, :js
    skip_load_and_authorize_resource only: :upload_pictures
  end

  def create
    create! do |success, failure|
      success.js { redirect_via_turbolinks_to resource }
      failure.js { render action: 'new' }
    end
  end

end