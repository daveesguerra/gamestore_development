class GenreController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render('list')
  end

  def list
      @genres = Genre.find(:all,
        :order => 'genre ASC')
  end

  def show
    @genre = Genre.find(params[:id])
    @games = Game.find(:all, :conditions => { :genre_id => params[:id]} )
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
    if (@genre.save)
      flash[:notice] = 'Genre created.'
      redirect_to(:action => 'list')
    else
      render('new')
    end

  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if (@genre.update_attributes(params[:genre]))
      flash[:notice] = 'Genre updated.'
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end

  def delete
    @genre = Genre.find(params[:id])
  end

  def destroy
    Genre.find(params[:id]).destroy
    flash[:notice] = 'Genre deleted.'
    redirect_to(:action => 'list')
  end

end
