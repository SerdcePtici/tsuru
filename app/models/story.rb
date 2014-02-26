class Story < ActiveRecord::Base
  validates :author, :title, :text, presence: true
  acts_as_commentable

  has_many :pictures, -> { order('position ASC') }, as: :picturable
  accepts_nested_attributes_for :pictures, reject_if: :all_blank

end
