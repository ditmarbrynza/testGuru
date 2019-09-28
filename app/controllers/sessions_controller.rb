class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:requested_page] || root_path
    else
      flash.now[:alert] = 'Are you a User? Verify your Email and Password please'
      render :new
    end
  end 

  def destroy
    session[:user_id] = nil
    redirect_to tests_path
  end

end
