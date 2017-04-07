class Api::StoresController < ApiController

  def index
    @stores = Store.all
    render json: @stores.as_json(methods: [:products]), status: 200
  end

  def over_price
    @products = Store.find(params[:id]).products.where('price > ?',params[:price])
    render json: @products.as_json
  end

end
