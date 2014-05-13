class Lesson < ActiveRecord::Base
  include AlbumConcern
  validates :title, uniqueness: true
end
