class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :edit, :create, :update]
  before_action ->(action=:manage, object=:lessons) { authorize! action, object }, only: %w{ new edit create update destroy }

  respond_to :html

  def index
    flash[:alert] = t '.flashes.alerts.viewing'
    redirect_to courses_path
  end

  def show
    respond_with(@lesson)
  end

  def new
    @lesson = Lesson.new
    respond_with(@lesson)
  end

  def edit
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.save
    respond_with(@lesson)
  end

  def update
    @lesson.update(lesson_params)
    respond_with(@lesson)
  end

  def destroy
    @lesson.destroy
    respond_with(@lesson)
  end

  def homework
    @homeworks = Lesson.find(params[:id]).homeworks
    respond_with(@homeworks)
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def lesson_params
      params.require(:lesson).permit(:title, :time, :teacher, :content, :course_id)
    end
end
