class GameController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render('list')
  end

  def list
      @games = Game.find(:all,
        :order => 'title ASC')
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    @game.image_path = '/images/games/'

    @consoles = Console.find(:all, :order => 'console ASC')
    @developers = Developer.find(:all, :order => 'developer ASC')
    @publishers = Publisher.find(:all, :order => 'publisher ASC')
    @genres = Genre.find(:all, :order => 'genre ASC')
    @features = Feature.find(:all, :order => 'feature ASC')
  end

  def create
    @game = Game.new(params[:game])
    console = Console.find(params[:console_id])
    @game.console = console
    developer = Developer.find(params[:developer_id])
    @game.developer = developer
    publisher = Publisher.find(params[:publisher_id])
    @game.publisher = publisher
    genre = Genre.find(params[:genre_id])
    @game.genre = genre

    @features = Feature.find(:all)
    checked_features = []
    checked_params = params[:feature_list] || []
    for check_box_id in checked_params
      feature = Feature.find(check_box_id)
      if not @game.features.include?(feature)
        @game.features << feature
      end
      checked_features << feature
    end
    missing_features = @features - checked_features
    for feature in missing_features
      if @game.features.include?(feature)
         @game.features.delete(feature)
      end
    end



    if (@game.save)
      flash[:notice] = 'Game created.'
      redirect_to(:action => 'list')
    else
      @consoles = Console.find(:all)
      @developers = Developer.find(:all)
      @publishers = Publisher.find(:all)
      @genres = Genre.find(:all)
      render('new')
    end

  end

  def edit
    @game = Game.find(params[:id])

    @consoles = Console.find(:all, :order => 'console ASC')
    @developers = Developer.find(:all, :order => 'developer ASC')
    @publishers = Publisher.find(:all, :order => 'publisher ASC')
    @genres = Genre.find(:all, :order => 'genre ASC')
    @features = Feature.find(:all, :order => 'feature ASC')
  end

  def update
    @game = Game.find(params[:id])
    console = Console.find(params[:console_id])
    @game.console = console
    developer = Developer.find(params[:developer_id])
    @game.developer = developer
    publisher = Publisher.find(params[:publisher_id])
    @game.publisher = publisher
    genre = Genre.find(params[:genre_id])
    @game.genre = genre

    @features = Feature.find(:all)
    checked_features = []
    checked_params = params[:feature_list] || []
    for check_box_id in checked_params
      feature = Feature.find(check_box_id)
      if not @game.features.include?(feature)
        @game.features << feature
      end
      checked_features << feature
    end
    missing_features = @features - checked_features
    for feature in missing_features
      if @game.features.include?(feature)
         @game.features.delete(feature)
      end
    end



    if (@game.update_attributes(params[:game]))
      flash[:notice] = 'Game updated.'
      redirect_to(:action => 'list')
    else
      @consoles = Console.find(:all)
      @developers = Developer.find(:all)
      @publishers = Publisher.find(:all)
      @genres = Genre.find(:all)
      render('edit')
    end
  end

  def delete
    @game = Game.find(params[:id])
  end

  def destroy
    Game.find(params[:id]).destroy
    flash[:notice] = 'Game deleted.'
    redirect_to(:action => 'list')
  end

end
