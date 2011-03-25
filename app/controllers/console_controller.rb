class ConsoleController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render('list')
  end

  def list
      @consoles = Console.find(:all,
        :order => 'console ASC')
  end

  def show
    @console = Console.find(params[:id])
    @games = Game.find(:all, :conditions => { :console_id => params[:id]} )
  end

  def new
    @console = Console.new
    @console.image_path = '/images/consoles/'
  end

  def create
    @console = Console.new(params[:console])
    if (@console.save)
      flash[:notice] = 'Console created.'
      redirect_to(:action => 'list')
    else
      render('new')
    end

  end

  def edit
    @console = Console.find(params[:id])
  end

  def update
    @console = Console.find(params[:id])
    if (@console.update_attributes(params[:console]))
      flash[:notice] = 'Console updated.'
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end

  def delete
    @console = Console.find(params[:id])
  end

  def destroy
    Console.find(params[:id]).destroy
    flash[:notice] = 'Console deleted.'
    redirect_to(:action => 'list')
  end

end