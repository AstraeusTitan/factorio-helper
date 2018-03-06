module ApplicationHelper
  def set_active_nav_item(path = '')
    request.path == path ? 'active' : ''
  end
end
