class Admin::PositionsController < Admin::UsersController
	before_action :set_positions, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses, only: [:new, :create, :edit, :update]
  
	def index
		@positions = Position.paginate(page: params[:page])
	end

	def new
  	@position = Position.new
  end

  def create
  	@position = Position.new(form_params)
  	if @position.save
  		redirect_to [:admin, @position]
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
  	if @position.update(form_params)
  		flash[:success] = "Successfully updated!"
  		redirect_to [:admin, @position]
  	else
  		flash[:danger] = "Failed!"
  		render 'edit'
  	end
  end

  def destroy
  	@position.destroy
  	redirect_to admin_positions_path
  end


  private

  def set_positions
  	@position = Position.find(params[:id])
  end

  def set_statuses
    @statuses = Status.all
  end

  def form_params
  	params.require(:position).permit(:title, :status_id)
  end
end
