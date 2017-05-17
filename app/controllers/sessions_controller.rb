class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to @user
      end
    else
      flash[:alert] = "Something went wrong let's try that again."
      redirect_to new_sessions_path
    end
  end
  
  def destroy
    session.clear
    redirect_to '/'
  end
  
  
  
end
