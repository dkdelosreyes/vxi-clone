class Admin::SourceInfosController < Admin::UsersController
	before_action :set_source_infos, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses, only: [:new, :create, :edit, :update]
  
	def index
		@source_infos = SourceInfo.paginate(page: params[:page])
	end

	def new
  	@source_info = SourceInfo.new
  end

  def create
  	@source_info = SourceInfo.new(form_params)
  	if @source_info.save
  		redirect_to [:admin, @source_info]
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
  	if @source_info.update(form_params)
  		flash[:success] = "Successfully updated!"
  		redirect_to [:admin, @source_info]
  	else
  		flash[:danger] = "Failed!"
  		render 'edit'
  	end
  end

  def destroy
  	@source_info.destroy
  	redirect_to admin_source_infos_path
  end


  private

  def set_source_infos
  	@source_info = SourceInfo.find(params[:id])
  end

  def set_statuses
    @statuses = Status.all
  end

  def form_params
  	params.require(:source_info).permit(:title, :status_id)
  end
end
