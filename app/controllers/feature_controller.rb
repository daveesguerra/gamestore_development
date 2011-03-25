class FeatureController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render('list')
  end

  def list
      @features = Feature.find(:all,
        :order => 'feature ASC')
  end

  def show
    @feature = Feature.find(params[:id])
    #@games = Game.find(:all, :conditions => { :feature_id => params[:id]} )
  end

  def new
    @feature = Feature.new
  end

  def create
    @feature = Feature.new(params[:feature])
    if (@feature.save)
      flash[:notice] = 'Feature created.'
      redirect_to(:action => 'list')
    else
      render('new')
    end

  end

  def edit
    @feature = Feature.find(params[:id])
  end

  def update
    @feature = Feature.find(params[:id])
    if (@feature.update_attributes(params[:feature]))
      flash[:notice] = 'Feature updated.'
      redirect_to(:action => 'list')
    else
      render('edit')
    end
  end

  def delete
    @feature = Feature.find(params[:id])
  end

  def destroy
    Feature.find(params[:id]).destroy
    flash[:notice] = 'Feature deleted.'
    redirect_to(:action => 'list')
  end

end
