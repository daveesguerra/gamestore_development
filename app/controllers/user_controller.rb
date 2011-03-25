class UserController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def list
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if (@user.save)
      flash[:notice] = 'User created.'
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if (@user.update_attributes(params[:user]))
      flash[:notice] = 'User updated.'
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = 'User deleted.'
    redirect_to(:action => 'list')
  end
end
