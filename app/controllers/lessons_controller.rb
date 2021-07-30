class LessonsController < ApplicationController
  def new
    @lesson = current_teacher.lessons.new
  end

  def create
    @lesson = current_teacher.lessons.new(lesson_params)
    if @lesson.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def lesson_params
    params.require(:lesson).permit(:start_datetime)
  end
end
