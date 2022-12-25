class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

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

  def update
    if @course.update(course_params)
      flash[:notice] = "You have successfully updated this course"
      # below is shortcut for: redirect_to course_path(@course)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    flash[:notice] = "Course was successfully deleted"
    redirect_to root_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :short_name, :description)
  end
end