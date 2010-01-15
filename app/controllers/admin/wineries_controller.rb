class Admin::WineriesController < Admin::BaseController
  set_tab :wines
  
  def new
    @winery = Winery.new
  end
end
