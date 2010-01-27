class Admin::GrapesController < Admin::BaseController
  before_filter :find_grape, :only => [:new, :show, :edit, :update, :destroy]

  set_tab :wines

  def index
    @grapes = Grape.paginate(:page => params[:page], :per_page => 10)
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

  def update
    if @grape.update_attributes(params[:grape])
      flash[:notice] = t('admin.flash.update_success', :resource => Grape.human_name)
      redirect_to admin_grape_path(@grape) 
    else
      render :action => :edit
    end
  end

  def destroy
    @grape.destroy
    redirect_to admin_grapes_url
  end

  private
  def find_grape
    @grape = params[:id] ? Grape.find(params[:id]) : Grape.new
  end
end