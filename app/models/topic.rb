class Topic < ActiveRecord::Base
  has_many :albums

  validates :title, uniqueness: true, presence: true

  def max_pictures_count
    2
  end
end
