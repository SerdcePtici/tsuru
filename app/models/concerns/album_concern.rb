module AlbumConcern
  extend ActiveSupport::Concern
  include Picturable


  included do
    has_many :pictures, as: :picturable, dependent: :destroy
    accepts_nested_attributes_for :pictures, reject_if: :all_blank

    acts_as_commentable

    validate :should_have_pictures
    validates :title, presence: true
    validates :pictures, presence: true

  end

  private

  def should_have_pictures
    if pictures.empty?
      errors.add :base, 'Вы не добавили ни одного изображения'
    end
  end
end