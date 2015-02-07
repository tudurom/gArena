class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :homeworks
end
