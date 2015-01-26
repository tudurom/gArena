module ApplicationHelper
  def style(*files)
    content_for(:styles) { stylesheet_link_tag *files }
  end
  def script(*files)
    content_for(:scripts) { javascript_include_tag *files }
  end
end
