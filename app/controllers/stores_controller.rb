class StoresController < ApplicationController

  before_action :authenticate_employee!

  def show
    @store = Store.find(params[:id])
  end

end
