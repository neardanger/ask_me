class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({username: params[:username]})
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You now have admin privelages"
      redirect_to root_path
    else
      flash[:failure] = "Invalid password"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
