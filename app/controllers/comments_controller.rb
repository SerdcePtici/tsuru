class CommentsController < ApplicationController
  inherit_resources
  belongs_to :story, polymorphic: true

  actions :create

  def permitted_params
    params.permit(comment: [:author, :comment, :magic, :text])
  end
end
