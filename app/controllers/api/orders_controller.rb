class Api::OrdersController < ApiController

  before_action :assert_user

  def create
    @order = @api_key.user.orders.create(order_params)
    if @order.save

      products = params[:products][:products]
      products.each do |product|
        @order.product_orders.create(product_id: product[:id], quantity: product[:quantity])
      end

      render json: @order.as_json
    else
      render json: {errors: @order.errors.full_messages }, status: 422
    end
  end

  def index
    @orders = @api_key.user.orders
    render json: @order.as_json(Order::Json::LIST)
  end

  def order_params
    params.require(:order).permit(:store_id, :order_status, :price, :pickup, :method, :card_id)
  end


end
