module ApplicationHelper
  def set_active_nav_item(path = '')
    request.env[ 'PATH_INFO' ] == path ? 'active' : ''
  end
end
