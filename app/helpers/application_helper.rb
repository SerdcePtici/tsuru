module ApplicationHelper
  def base_errors(record)
    record.errors[:base].inject ''.html_safe do |list, error|
      list << "<div class='alert alert-error'>#{error}</div>".html_safe
    end
  end

  def menu_link_to(*args, ** opts)
    if opts[:id] == @current_menu_item
      opts[:class] ||= ''
      opts[:class] << ' active'
      opts[:class].strip
    end
    link_to *args, ** opts
  end
end
