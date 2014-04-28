module Picturable
  extend ActiveSupport::Concern

  def pictures_field_name
    respond_to?(:picture) ? :picture : :pictures
  end

  def multiple_pictures?
    respond_to?(:pictures) ? true : false
  end

end