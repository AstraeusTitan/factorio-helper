module ApplicationHelper
  def set_active_nav_item(link_path = '')
    current_page?(link_path) ? 'active' : ''
  end
end
