class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:edit, :update, :destroy, :new]
  before_action ->(action=:manage, object=:courses) { authorize! action, object }, only: %w{ new edit create update destroy }

  respond_to :html

  def index
    if(can? :manage, :courses)
      @courses = Course.all
    elsif(can? :view, :courses)
      @courses = current_user.courses
    else
      @courses = Course.where(public: true)
    end
    respond_with(@courses)
  end

  def show
    if(@course.public == false && can?(:view, :course))
      respond_with(@course)
    elsif @course.public
      respond_with(@course)
    else
      authenticate_user!
    end
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    params[:students].each do |s|
      @course.users << User.find(s[1])
    end
    @course.save
    respond_with(@course)
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  def destroy
    @course.destroy
    respond_with(@course)
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :subject, :teacher, :lesson_id, students: [])
    end

end
