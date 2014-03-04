class Topic < ActiveRecord::Base
  has_many :albums

  validates :title, uniqueness: true, presence: true
end
