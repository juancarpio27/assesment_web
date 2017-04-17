class ProductStoresController < ApplicationController

  before_action :authenticate_employee!
  before_action :set_store

  def index
    @product_stores = @store.product_stores
  end

  def new
    @product_store = ProductStore.new
  end

  def create
    @product_store = @store.product_stores.build(product_store_params)
    if @product_store.save
      redirect_to store_product_stores_path(@store)
    else
      redirect_to new_store_product_stores_path(@store)
    end
  end

  def edit
    @product_store = @store.product_stores.find(params[:id])
  end

  def update
    @product_store = @store.product_stores.find(params[:id])
    if @product_store.update(product_store_params)
      redirect_to store_product_stores_path(@store)
    else
      redirect_to edit_store_product_stores_path(@store)
    end
  end

  def show
    @product_store = @store.product_stores.find(params[:id])
  end

  def destroy
    @product_store = @store.product_stores.find(params[:id])
    if @product_store.destroy
      redirect_to store_product_stores_path(@store)
    else
      redirect_to store_product_stores_path(@store)
    end
  end



  protected

  def product_store_params
    params.require(:product_store).permit(:product_id, :quantity)
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

end
