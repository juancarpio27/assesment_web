class Api::OrdersController < ApiController

  before_action :assert_user

  def create
    @order = @api_key.user.orders.create(order_params)
    if @order.save
      render json: @order.as_json
    else
      render json: {errors: @order.errors.full_messages }, status: 422
    end
  end

  def order_params
    params.require(:order).permit(:store_id, :order_status, :price, :pickup, :method)
  end


end
