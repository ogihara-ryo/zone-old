class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy start finish)

  # GET /users/:user_id/tasks
  # GET /users/:user_id/tasks.json
  def index
    @tasks = Task.where(user: @user)
    @task = Task.new
  end

  # POST /users/:user_id/tasks
  # POST /users/:user_id/tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to user_task_path(@user, @task), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/:user_id/tasks/1
  # PATCH/PUT /users/:user_id/tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to user_task_path(@user, @task), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:user_id/tasks/1
  # DELETE /users/:user_id/tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to user_task_path(@user, @task), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @task.started!
  end

  def finish
    @task.finished!
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:title, :estimate, :actual, :status, :user_id)
  end
end
