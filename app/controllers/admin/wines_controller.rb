class Admin::WinesController < Admin::BaseController
  set_tab :wines
  
  def new
    @wine = Wine.new
  end
end
