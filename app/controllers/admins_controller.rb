class AdminsController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def login_as_teacher
    @teacher = Teacher.find(params[:id])
    sign_in @teacher, scope: :admin
    redirect_to admins_path
  end
end
