module CommentsHelper
  def comments_parent
    resource.kind_of?(Comment) ? parent : resource
  end

  def comment
    if resource.kind_of?(Comment)
      resource.new_record? ? resource : parent.comments.build
    else
      resource.comments.build
    end
  end
end
