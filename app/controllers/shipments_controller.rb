class ShipmentsController < ApplicationController

  before_action :authenticate_employee!
  before_action :set_store

  def index
    @shipments = @store.shipments
  end

  def show
    @shipment = @store.shipments.find(params[:id])
  end

  def deliver
    @shipment = @store.shipments.find(params[:id])
    @shipment.delivered!
    @shipment.received = Time.now - 5.hours
    @shipment.save!
    redirect_to store_shipment_path(@store,@shipment)
  end

  protected

  def set_store
    @store = Store.find(params[:store_id])
  end


end
