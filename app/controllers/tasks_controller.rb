class TasksController < ApplicationController
  def index
    @tasks = Task.newest_to_oldest

    respond_to do |format|
      format.html
      format.json { render json: @tasks }
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    # epic outbreak
    user = User.where(name: user_params[:name])

    if user.empty?
      new_user = User.create(user_params)
      @task.user = new_user
    else
      @task.user = user.first
    end

    # user?
    if @task.save
      # what to do?
      redirect_to @task
    else
      # ooops?
      render :new, status: :unprocessable_entity
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :user)
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
