class Story < ActiveRecord::Base
  validates :author, :title, :text, presence: true
end
