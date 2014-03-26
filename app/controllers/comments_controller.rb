class CommentsController < ApplicationController
  inherit_resources
  belongs_to :story, :album, :lesson, polymorphic: true, optional: true
  load_and_authorize_resource

  actions :create, :destroy

  def destroy
    destroy! do |success, failure|
      success.js { render :destroy }
      success.html { redirect_to :back }
    end
  end

  def permitted_params
    params.permit(comment: [:author, :comment, :text])
  end
end
