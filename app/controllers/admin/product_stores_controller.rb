class Admin::ProductStoresController < AdminController

  before_action :load_store

  def index
    @product_stores = @store.product_stores
  end

  def show
  end

  def new
    @product_store = ProductStore.new
  end

  def create
    @product_store = @store.product_stores.build(product_store_params)
    if @product_store.save
      redirect_to admin_store_product_stores_path(@store)
    else
      redirect_to new_admin_store_product_stores_path(@store)
    end
  end

  def edit
  end

  protected

  def load_store
    @store = Store.find(params[:store_id])
  end

  def product_store_params
    params.require(:product_store).permit(:product_id)
  end



end
