class Admin::StoresController < AdminController

  def index
    @stores = Store.all
  end

end
