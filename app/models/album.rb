class Album < ActiveRecord::Base
  include Concerns::Album

  belongs_to :topic
  validates :topic, presence: true

end
