class StoriesController < ApplicationController
  inherit_resources

  private

  def permitted_params
    params.permit(story: [:author, :title, :text])
  end
end
