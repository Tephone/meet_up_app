class AdminsController < ApplicationController
  def index
    @teachers = Teacher.all
  end
end
