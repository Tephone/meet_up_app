class StudentsController < ApplicationController
  def index
    @lessons = current_student.lessons_reserved
  end

  def show
    @student = current_student
    @current_student_lesson_count =  @student.lesson_count
  end
end
