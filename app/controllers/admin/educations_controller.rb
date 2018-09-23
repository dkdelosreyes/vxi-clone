class Admin::EducationsController < Admin::UsersController
	before_action :set_educations, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses, only: [:new, :create, :edit, :update]
  
	def index
		@educations = Education.paginate(page: params[:page])
	end

	def new
  	@education = Education.new
  end

  def create
  	@education = Education.new(form_params)
  	if @education.save
  		redirect_to [:admin, @education]
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
  	if @education.update(form_params)
  		flash[:success] = "Successfully updated!"
  		redirect_to [:admin, @education]
  	else
  		flash[:danger] = "Failed!"
  		render 'edit'
  	end
  end

  def destroy
  	@education.destroy
  	redirect_to admin_educations_path
  end


  private

  def set_educations
  	@education = Education.find(params[:id])
  end

  def set_statuses
    @statuses = Status.all
  end

  def form_params
  	params.require(:education).permit(:title, :status_id)
  end
end
