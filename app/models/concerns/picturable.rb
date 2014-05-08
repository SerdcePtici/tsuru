module Picturable
  extend ActiveSupport::Concern

  def max_pictures_count
    nil
  end

  def picturable?
    if max_pictures_count && max_pictures_count == 0
      false
    else
      true
    end
  end

  def pictures_field_name
    respond_to?(:picture) ? :picture : :pictures
  end

  def multiple_pictures?
    respond_to?(:pictures) ? true : false
  end

end