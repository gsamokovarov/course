class TasksController < ApplicationController
  before_action :set_lecture

  def index
    @tasks = @lecture.tasks
  end

  # POST /lectures/1/tasks/new
  def new
    @task = Task.new
  end

  # POST /lectures/1/tasks
  def create
    @task = @lecture.tasks.build(task_params)
    if @task.save
      redirect_to lecture_tasks_path(params[:lecture_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PUT /lectures/1/tasks/new
  def edit
    @task = @lecture.tasks.find(params[:id])
  end

  def update
    @task = @lecture.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to lecture_tasks_path(params[:lecture_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
end
