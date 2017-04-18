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

end
