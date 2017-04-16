class Api::OrdersController < ApiController

  before_action :assert_user

  def create
    @order = @api_key.user.orders.create(order_params)
    if @order.save
      @api_key.user.update_points(@order.price*0.1)
      products = params[:products][:products]
      products.each do |product|
        @order.product_orders.create(product_id: product[:id], quantity: product[:quantity])
      end
      render json: @order.as_json(Order::Json::CREATE)
    else
      render json: {errors: @order.errors.full_messages }, status: 422
    end
  end

  def index
    @orders = @api_key.user.orders
    render json: @orders.as_json(Order::Json::LIST)
  end

  def show
    @order = @api_key.user.orders.find(params[:id])
    render json: @order.as_json(Order::Json::SHOW)
  end

  def order_params
    params.require(:order).permit(:store_id, :order_status, :price, :pickup, :method, :card_id)
  end


end
