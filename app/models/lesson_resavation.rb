class LessonResavation < ApplicationRecord
  belongs_to :student
  belongs_to :lesson
end
