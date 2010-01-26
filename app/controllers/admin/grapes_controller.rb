class Admin::GrapesController < Admin::BaseController
  set_tab :wines
  
  def new
    @grape  = Grape.new
  end
  
  def create
    @grape  = Grape.new(params[:grape])
    if @grape.save
      flash[:notice] = t('admin.flash.create_success', :resource => Grape.human_name)
      redirect_to admin_grapes_url
    else
      render :action => :new
    end
  end
  
end
