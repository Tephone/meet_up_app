class TeacherHomesController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @lessons = Lesson.page(params[:page])
    if params[:teacher].present?
      @lessons = @lessons.joins(:teacher).where('teachers.name LIKE ? ', params[:teacher] ).page(params[:page])
    end
    if  params[:language].present? 
      @lessons = @lessons.joins(teacher: :language).where('languages.id::text LIKE ?', params[:language]).page(params[:page])
    end
    if params[:date].present?
      @lessons = @lessons.where('start_datetime >= ? AND ? > start_datetime', params[:date].in_time_zone.beginning_of_day, params[:date].in_time_zone.end_of_day).page(params[:page])
    end
  end
end
