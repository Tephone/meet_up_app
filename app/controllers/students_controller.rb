class StudentsController < ApplicationController
  def index
  end

  def show
    @student = current_student
  end
end
