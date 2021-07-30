class StudentsController < ApplicationController
  def show
    @student = current_student
  end
end
