class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy start finish)

  # GET /users/:user_id/tasks
  # GET /users/:user_id/tasks.json
  def index
    redirect_to root_path and return unless signed_in?
    set_tasks
    @task = Task.new
  end

  # POST /users/:user_id/tasks
  # POST /users/:user_id/tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        set_tasks
        format.js { render_index }
        format.json { render :show, status: :created, location: @task }
      else
        format.js { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/:user_id/tasks/1
  # PATCH/PUT /users/:user_id/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        set_tasks
        format.js { render_index }
        format.json { render :show, status: :ok, location: @task }
      else
        format.js { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:user_id/tasks/1
  # DELETE /users/:user_id/tasks/1.json
  def destroy
    @task.destroy
    set_tasks
    respond_to do |format|
      format.js { render_index }
      format.json { head :no_content }
    end
  end

  def start
    @task.started!
    render_index
  end

  def finish
    @task.finished!
    render_index
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def set_tasks
    @tasks = Task.where(user: @user)
  end

  def render_index
    set_tasks
    @task = Task.new
    render :index
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :estimate, :actual, :status, :user_id)
  end
end
