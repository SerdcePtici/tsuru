class Story < ActiveRecord::Base
  include Picturable
  MAX_PICTURES_COUNT = 2

  validates :author, :title, :text, presence: true
  acts_as_commentable

  has_many :pictures, -> { order('position ASC') }, as: :picturable, dependent: :destroy
  accepts_nested_attributes_for :pictures, reject_if: :all_blank

  validates :pictures, length: { maximum: MAX_PICTURES_COUNT }

  def max_pictures_count
    MAX_PICTURES_COUNT
  end
end
