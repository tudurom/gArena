require 'sanitize'

module CoursesHelper
  def lesson_preview(id)
    content = Maruku.new(@course.lessons.find(id).content).to_html
    text = sanitize content
    result = truncate text, length: 100
  end
end
