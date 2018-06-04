class Admin::AccessoriesController < Admin::BaseController
  def index
    @accessories = Accessory.paginate(page: params[:page], per_page: 12)
  end

  def new
    @accessory = Accessory.new
  end

  def create
    @accessory = Accessory.create(accessory_params)
    if @accessory.save
      redirect_to admin_bike_shop_path
    else
      flash[:notice] = "Accessory #{@accessory.title} already exists. Please fill in fields with valid information."
      render :new
    end
  end


  private

  def accessory_params
    # list_params_allowed = [:title, :description, :thumbnail, :price]
    # list_params_allowed << :role if current_user.admin?
    params.require(:accessory).permit(:title, :description, :thumbnail, :price)
  end
end
