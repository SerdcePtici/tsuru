module ApplicationHelper
  def base_errors(record)
    record.errors[:base].inject '' do |list, error|
      list << "<div class='alert alert-error'>#{error}</div>".html_safe
    end
  end
end
