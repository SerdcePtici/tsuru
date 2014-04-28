class Album < ActiveRecord::Base
  include AlbumConcern

  belongs_to :topic
  validates :topic, presence: true

end
