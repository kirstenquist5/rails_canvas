class EnrollementsController < ApplicationController
  before_action :set_course

  def index
    @teachers = @course.enrollements.where(role: 'Teacher')
    @tas = @course.enrollements.where(role: 'Ta')
    @students = @course.enrollements.where(role: 'Students')
  end

  def new
    @enrollement = @course.enrollements.new
  end

  def create
    @enrollement = @course.enrollements.new(enrollement_params)
    if @enrollement.save
      redirect_to course_enrollements_path
    else
      render :new
    end
  end

  def destroy
    enrollement = @course.enrollements.find(params[:id])
    enrollement.destroy
    redirect_to course_enrollements_path
  end

  private 
    def enrollement_params
      params.require(:enrollement).permit(:role, :user_id)
    end 

    def set_course
      @course = Course.find(params[:id])
    end
end