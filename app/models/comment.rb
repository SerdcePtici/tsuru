class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  include Picturable

  belongs_to :commentable, polymorphic: true
  has_one :picture, as: :picturable, dependent: :destroy

  accepts_nested_attributes_for :picture, reject_if: :all_blank

  validates :author, :comment, presence: true
  validates :picture, absence: true, unless: :picturable?

  default_scope -> { order('created_at DESC') }

  def max_pictures_count
    commentable.instance_of?(Lesson) ? 1 : 0
  end

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  #belongs_to :user
end
