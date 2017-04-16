class Api::StoresController < ApiController

  def index
    @stores = Store.all
    render json: @stores.as_json
  end

  def show
    @store = Store.find(params[:id])
    render json @store.as_json
  end

end
