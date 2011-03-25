class CustomerController < ApplicationController

  layout 'admin'
  before_filter :authorize_access

  def index
    list
    render(:action => 'list')
  end

  def list
    @customers = Customer.find(:all)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = 'Customer created'
      redirect_to(:action => 'list')
    else
      render(:action => 'new')
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:notice] = 'Customer updated'
      redirect_to(:action => 'show', :id => @customer.id)
    else
      render(:action => 'edit')
    end
  end

  def delete
    @customer = Customer.find(params[:id])
  end

  def destroy
    Customer.find(params[:id]).destroy
    flash[:notice] = 'Customer deleted.'
    redirect_to(:action => 'list')
  end
end
