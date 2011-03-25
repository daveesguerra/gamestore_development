class DeveloperController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render('list')
  end

  def list
      @developers = Developer.find(:all,
        :order => 'developer ASC')
  end

  def show
    @developer = Developer.find(params[:id])
    @games = Game.find(:all, :conditions => { :developer_id => params[:id]} )
  end

  def new
    @developer = Developer.new
    @developer.image_path = '/images/developers/'
  end

  def create
    @developer = Developer.new(params[:developer])
    if (@developer.save)
      flash[:notice] = 'Developer created.'
      redirect_to(:action => 'list')
    else
      render('new')
    end

  end

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    @developer = Developer.find(params[:id])
    if (@developer.update_attributes(params[:developer]))
      flash[:notice] = 'Developer updated.'
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end

  def delete
    @developer = Developer.find(params[:id])
  end

  def destroy
    Developer.find(params[:id]).destroy
    flash[:notice] = 'Developer deleted.'
    redirect_to(:action => 'list')
  end

end
