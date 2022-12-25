class CoursesController < ApplicationController

  def index 
    @courses = Course.all
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

  def course_params
    params.require(:course).permit(:name, :short_name, :description)
  end
end