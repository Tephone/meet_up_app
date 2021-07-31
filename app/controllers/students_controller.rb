class StudentsController < ApplicationController
  def index
    @lessons = current_student.lessons_reserved
  end

  def show
    @student = current_student
  end
end
