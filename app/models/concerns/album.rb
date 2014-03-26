module Concerns::Album
  extend ActiveSupport::Concern

  included do
    has_many :pictures, as: :picturable, dependent: :destroy
    accepts_nested_attributes_for :pictures, reject_if: :all_blank
    attr_accessor :files

    acts_as_commentable

    validate :should_have_pictures
    validates :title, presence: true
    validates :pictures, presence: true

    before_validation :create_pictures
  end

  private

  def create_pictures
    files.try(:each) do |file|
      pictures.build file: file
    end
  end

  def should_have_pictures
    if pictures.empty?
      errors.add :base, 'Вы не добавили ни одного изображения'
    end
  end
end