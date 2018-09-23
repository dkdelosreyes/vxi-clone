class Admin::BlogsController < Admin::UsersController
	layout 'admin'

  before_action :set_blogs, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses, only: [:new, :create, :edit, :update]
  
	def index
		@blogs = Blog.paginate(page: params[:page])
	end

	def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.new(blog_params)
  	if @blog.save
  		redirect_to [:admin, @blog]
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
  	if @blog.update(blog_params)
  		flash[:success] = "Successfully updated!"
  		redirect_to [:admin, @blog]
  	else
  		flash[:danger] = "Failed!"
  		render 'edit'
  	end
  end

  def destroy
  	@blog.destroy
  	redirect_to admin_blogs_path
  end


  private

  def set_blogs
  	@blog = Blog.find(params[:id])
  end

  def set_statuses
    @statuses = Status.all
  end

  def blog_params
  	params.require(:blog).permit(:title, :description, :status_id, :user_id, :photo)
  end

end
