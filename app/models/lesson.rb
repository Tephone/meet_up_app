class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_resavation
end
