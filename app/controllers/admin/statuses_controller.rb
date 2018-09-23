class Admin::StatusesController < Admin::UsersController
	before_action :set_status, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  def index
    @statuses = Status.paginate(page: params[:page])
  end

  def new
  	@status = Status.new
  end

  def create
  	params[:status][:title] = params[:status][:code].capitalize if params[:status][:title].blank?

  	@status = Status.new(status_params)
  	if @status.save
  		redirect_to [:admin, @status]
  	else
  		flash[:danger] = "Can't save"
  		render 'new'
  	end
  end

  def update
  	if @status.update(status_params)
  		flash[:success] = "Successfully updated!"
  		redirect_to [:admin, @status]
  	else
  		flash[:danger] = "Failed!"
  		render 'edit'
  	end
  end

  def destroy
  	@status.destroy
  	redirect_to admin_statuses_path
  end


  private

  def set_status
  	@status = Status.find(params[:id])
  end

  def status_params
  	params.require(:status).permit(:title, :code)
  end


end
