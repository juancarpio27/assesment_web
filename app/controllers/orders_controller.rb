class OrdersController < ApplicationController

  before_action :authenticate_employee!
  before_action :set_store

  def index
    date = Time.now - 5.hours
    @orders = @store.orders.where(pickup: date.midnight..date.end_of_day)
  end

  def show
    @order = @store.orders.find(params[:id])
  end

  def new
    @order = Order.new
    @product_orders = @order.product_orders.build
  end

  def create
    @order = @store.orders.build(order_params)
    @order.order_status = 'delivered'
    @order.pickup = Time.now - 5.hours
    @order.price = 100
    @order.received = Time.now - 5.hours
    if @order.save
      redirect_to store_orders_path(@store)
    else
      puts @order.errors.full_messages
      redirect_to new_store_order_path(@store)
    end

  end

  def deliver
    @order = @store.orders.find(params[:id])
    @order.delivered!
    @order.received = Time.now - 5.hours
    @order.save!
    redirect_to store_order_path(@store,@order)
  end

  def cancel
    @order = @store.orders.find(params[:id])
    @order.canceled!
    redirect_to store_order_path(@store,@order)
  end

  protected

  def set_store
    @store = Store.find(params[:store_id])
  end

  def order_params
    params.require(:order).permit(:user_id, :method, product_orders_attributes: [:product_id, :quantity, :_destroy])
  end

end
