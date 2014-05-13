class Album < ActiveRecord::Base
  include AlbumConcern

  belongs_to :topic
  validates :topic, presence: true
  validates_uniqueness_of :title, scope: :topic

end
