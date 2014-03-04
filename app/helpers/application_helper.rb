module ApplicationHelper
  def base_errors(record)
    record.errors[:base].inject '' do |list, error|
      list << "<div class='alert alert-error'>#{error}</div>".html_safe
    end
  end

  def menu_link_to(title, path, *args, ** opts)
    if opts[:id] == @current_menu_item
      opts[:class] ||= ''
      opts[:class] << ' active'
      opts[:class].strip
    end
    link_to title, path, ** opts
  end
end
