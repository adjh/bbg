class Admin::GrapesController < Admin::BaseController
  set_tab :wines
  
  def new
    @grape  = Grape.new
  end
end
