class Admin::LocationsController < Admin::UsersController
  before_action :set_locations, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses, only: [:new, :create, :edit, :update]
  
	def index
		@locations = Location.paginate(page: params[:page])
	end

	def new
  	@location = Location.new
  end

  def create
  	@location = Location.new(form_params)
  	if @location.save
  		redirect_to [:admin, @location]
  	else
  		flash[:danger] = "Can't save"
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @location.update(form_params)
  		flash[:success] = "Successfully updated!"
  		redirect_to [:admin, @location]
  	else
  		flash[:danger] = "Failed!"
  		render 'edit'
  	end
  end

  def destroy
  	@location.destroy
  	redirect_to admin_locations_path
  end


  private

  def set_locations
  	@location = Location.find(params[:id])
  end

  def set_statuses
    @statuses = Status.all
  end

  def form_params
  	params.require(:location).permit(:title, :status_id)
  end

end
