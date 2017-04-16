class Api::OffersController < ApiController

  def index
    @offers = Offer.order('created_at DESC').limit(4)
    render json: @offers.as_json
  end

end
