class LessonResavationsController < ApplicationController
  def create
    lesson_resavation = current_student.lesson_resavations.new(lesson_resavation_params)
    lesson_resavation.save
    redirect_to root_path, notice: '予約しました'

  end

  def destroy
    lesson_resavation = current_student.lesson_resavations.find(params[:id])
    lesson_resavation.destroy!
    redirect_to root_path, notice: '予約を解除しました'
  end

  private
  
  def lesson_resavation_params
    params.require(:lesson_resavation).permit(:lesson_id)
  end
end
