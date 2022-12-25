class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update]

  def index 
    @courses = Course.all
  end

  def show

  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Course successfully created"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :short_name, :description)
  end
end