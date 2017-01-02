class TopController < ApplicationController
  def index
    redirect_to tasks_path if signed_in?
  end
end
