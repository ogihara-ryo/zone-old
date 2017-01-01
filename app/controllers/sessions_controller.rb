class SessionsController < ApplicationController
  def create
    user = User.find_by(name: session_param[:name])
    if authenticated?(user)
      sign_in user
      redirect_back
    else
      render 'sign_in_failed'
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_path
  end

  private

  def session_param
    params.require(:session).permit(:name, :password)
  end

  def authenticated?(user)
    user.present? && user.authenticate(session_param[:password])
  end
end
