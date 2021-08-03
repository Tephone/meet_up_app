class TeachersController < ApplicationController
  def index
  end

  def show
    @teacher = current_teacher
  end
end
