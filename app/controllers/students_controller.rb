class StudentsController < ApplicationController
  before_action :authenticate_student!

  def index
    @lessons = current_student.lessons_reserved.page(params[:page])
  end

  def show
    @student = current_student
    @current_student_lesson_count = @student.lesson_count
  end
end
