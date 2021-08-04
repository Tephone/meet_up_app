class Lesson < ApplicationRecord
  belongs_to :teacher
  has_one :lesson_resavation
  validates :start_datetime, presence: true
end
