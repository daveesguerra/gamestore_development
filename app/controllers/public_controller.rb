class PublicController < ApplicationController

  layout 'public'

  before_filter :find_or_create_cart, :except => [:list, :show]

  def index
    list
    redirect_to(:action => 'list')
  end

  def list
    @games = Game.find(:all, :order => 'title ASC')
  end

  def show
    @game = Game.find(params[:id])
  end

  def add_to_cart
    @game = Game.find(params[:id])
    game = Game.find(params[:id])
    @cart.add_game(game)
    redirect_to(:action => 'show_cart')
  end

  def show_cart
  end

  def empty_cart
    @cart.empty_all_items
    flash[:notice] = 'Your cart is now empty.'
    redirect_to(:action => 'list')
  end

  def remove_from_cart
    game = Game.find(params[:id])
    @cart.remove_game(game)
    flash[:notice] = 'One item was removed from your cart.'
    redirect_to(:action => 'show_cart')
  end

  def checkout
    @customer = Customer.new
  end

  def save_order
    @customer = Customer.new(params[:customer])
    #credit_card_number = params[:credit_card]
    @order = Order.new
    @order.line_items << @cart.items
    @customer.orders << @order
    if @customer.save
      #try to process payment
      @cart.empty_all_items
      redirect_to(:action => 'show_receipt', :id => @order.id)
    else
      render(:action => 'checkout')
    end
  end

  def show_receipt
    @order = Order.find(params[:id])
  end
  private #-------------------

  def find_or_create_cart
    @cart = session[:cart] ||= Cart.new
  end

end
