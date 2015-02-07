class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :destroy]
  before_action :authenticate_user!, :only => [:edit, :update, :destroy, :new]
  before_action ->(action=:view_create, object=:homework) { authorize! action, object }, only: %w{ new create show }
  before_action ->(action=:manage, object=:homework) { authorize! action, object }, only: %w{ destroy }
  respond_to :html

  def index
    flash[:error] = "This page does not exist"
    redirect_to root_path
  end

  def show
    respond_with(@homework)
  end

  def new
    @homework = Homework.new
    respond_with(@homework)
  end

  def create
    @homework = Homework.new(homework_params)
    @homework.save
    respond_with(@homework)
  end

  def destroy
    @homework.destroy
    respond_with(@homework)
  end

  private
    def set_homework
      @homework = Homework.find(params[:id])
    end

    def homework_params
      params.require(:homework).permit(:lesson_id, :title, :content, :student, :time)
    end
end
