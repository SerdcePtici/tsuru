module PicturesHelper
  def file_field_label(picturable)
    label = 'Добавить изображения'
    if picturable.max_pictures_count
      "#{label} (#{picturable.max_pictures_count} максимум)"
    else
      label
    end
  end
end
