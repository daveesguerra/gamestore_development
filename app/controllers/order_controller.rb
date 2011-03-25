class OrderController < ApplicationController
  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render(:action => 'list')
  end

  def list
    @orders = Order.find(:all)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = 'Order created'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(params[:order])
      flash[:notice] = 'Order updated.'
      redirect_to(:action =>'show', :id => @order.id)
    else
      render(:action =>'edit')
    end
  end

  def delete
    @order = Order.find(params[:id])
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:notice] = 'Order deleted.'
    redirect_to(:action =>'list')
  end
end
