module CommentsHelper
  def commentable
    resource.kind_of?(Comment) ? parent : resource
  end

  def new_comment
    @new_comment ||= if resource.kind_of?(Comment) && resource.new_record?
       resource
    else
      commentable.comments.build
    end
  end
end
