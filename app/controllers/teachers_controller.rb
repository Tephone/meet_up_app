class TeachersController < ApplicationController
  before_action :authenticate_teacher!, if: :teacher_signed_in?
  before_action :authenticate_admin!, if: :admin_signed_in?
  before_action :set_teacher, only: %i[show edit update destroy]

  def index
    @lessons = current_teacher.lessons.page(params[:page])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    teacher = Teacher.new(teacher_params)
    if teacher.save
      redirect_to admins_path
    else
      render 'teachers/new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @teacher.update(teacher_params)
    if admin_signed_in?
      redirect_to admins_path, notice: "#{@teacher.name}を編集しました"
    else
      redirect_to teacher_path, notice: "#{@teacher.name}を編集しました"
    end
  end

  def destroy
    @teacher.destroy!
    redirect_to admins_path, notice: '削除しました'
  end

  private

  def teacher_params
    params.require(:teacher).permit %i[name email language_id profile image password password_confirmation]
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
