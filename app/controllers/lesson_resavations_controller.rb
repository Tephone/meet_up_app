class LessonResavationsController < ApplicationController
  def create
    lesson_resavation = current_student.lesson_resavations.new(lesson_resavation_params)
    if current_student.lesson_count == 0
      redirect_to student_homes_path, notice: 'チケットを購入してください'
    else
      lesson_resavation.save
      NoticeMailer.lesson_resavation_notice_mail_to_student(lesson_resavation).deliver
      NoticeMailer.lesson_resavation_notice_mail_to_teacher(lesson_resavation).deliver
      redirect_to student_homes_path, notice: '予約しました'
    end
  end

  def destroy
    lesson_resavation = current_student.lesson_resavations.find(params[:id])
    lesson_resavation.destroy!
    redirect_to student_homes_path, notice: '予約を解除しました'
  end

  private

  def lesson_resavation_params
    params.require(:lesson_resavation).permit(:lesson_id)
  end
end
