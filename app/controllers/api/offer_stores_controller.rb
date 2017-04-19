class Api::OfferStoresController < ApplicationController

  before_action :assert_user

  def get_last_promotion
    last_order = @api_key.user.orders
    if last_order.any?
      @offer_store = last_order.last.store.offer_stores.last
      render json: @offer_store.as_json(methods: [:store])
    else
      render json: {success: false}
    end
  end


end
