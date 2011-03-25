class AdminController < ApplicationController

  layout 'admin', :except => [:login]
  before_filter :authorize_access, :except => [:login, :send_login]

  def index
    
  end

  def login
    @user = User.new
  end

  def send_login
    @user = User.new(params[:user])
    logged_in_user = @user.try_to_login
    if logged_in_user
      session[:user_id] = logged_in_user.id
      flash[:notice] = 'You are now logged in.'
      redirect_to(:action => 'index')
    else
      flash[:notice] = 'Username/password combination incorrect. Please try again.'
      redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You are now logged out."
    redirect_to(:action => 'login')
  end

  private #----------------

  def authorize_access
    if not session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:action => 'login')
    end
  end
end
