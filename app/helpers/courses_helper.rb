module CoursesHelper
  def lesson_preview(id)
    text = @course.lessons.find(id).content
    words = text.split(' ')
    final = ''
    words.each do |word|
      final += word if final.size + word.size < 100
    end
    final += '...'
  end
end
