class Picture < ActiveRecord::Base
  mount_uploader :file, PictureUploader
  belongs_to :picturable, polymorphic: true
  acts_as_list scope: :picturable

  validates :file, presence: true

  def to_s
    file.url
  end
end
