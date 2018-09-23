class Admin::ExperiencesController < Admin::UsersController
	before_action :set_experiences, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses, only: [:new, :create, :edit, :update]
  
	def index
		@experiences = Experience.paginate(page: params[:page])
	end

	def new
  	@experience = Experience.new
  end

  def create
  	@experience = Experience.new(form_params)
  	if @experience.save
  		redirect_to [:admin, @experience]
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
  	if @experience.update(form_params)
  		flash[:success] = "Successfully updated!"
  		redirect_to [:admin, @experience]
  	else
  		flash[:danger] = "Failed!"
  		render 'edit'
  	end
  end

  def destroy
  	@experience.destroy
  	redirect_to admin_experiences_path
  end


  private

  def set_experiences
  	@experience = Experience.find(params[:id])
  end

  def set_statuses
    @statuses = Status.all
  end

  def form_params
  	params.require(:experience).permit(:title, :status_id)
  end

end
