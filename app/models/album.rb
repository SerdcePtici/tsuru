class Album < ActiveRecord::Base
  belongs_to :topic
  has_many :pictures, as: :picturable, dependent: :destroy

  validates :title, presence: true
  attr_accessor :files

  before_create :create_pictures

  def create_pictures
    files.each do |file|
      self.pictures.build file: file
    end
  end
end
