class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @teachers = Teacher.page(params[:page])
  end

  def login_as_teacher
    teacher = Teacher.find(params[:id])
    sign_in teacher, scope: :admin
    redirect_to admins_path
  end
end
