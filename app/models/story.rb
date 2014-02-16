class Story < ActiveRecord::Base
  validates :author, :title, :text, presence: true
  acts_as_commentable
end
