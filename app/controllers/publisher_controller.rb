class PublisherController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render('list')
  end

  def list
      @publishers = Publisher.find(:all,
        :order => 'publisher ASC')
  end

  def show
    @publisher = Publisher.find(params[:id])
    @games = Game.find(:all, :conditions => { :publisher_id => params[:id]} )
  end

  def new
    @publisher = Publisher.new
    @publisher.image_path = '/images/publishers/'
  end

  def create
    @publisher = Publisher.new(params[:publisher])
    if (@publisher.save)
      flash[:notice] = 'Publisher created.'
      redirect_to(:action => 'list')
    else
      render('new')
    end

  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
    if (@publisher.update_attributes(params[:publisher]))
      flash[:notice] = 'Publisher updated.'
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end

  def delete
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    Publisher.find(params[:id]).destroy
    flash[:notice] = 'Publisher deleted.'
    redirect_to(:action => 'list')
  end

end
