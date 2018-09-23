class PagesController < ApplicationController
  def home
  	@applicant = Applicant.new
  end

  def blogs
    @blogs = Blog.all
  end

  def blog
    id = params[:id].to_i unless params[:id].match(/[^[:digit:]]+/)
    @blog = Blog.find_by_id(id) if id.is_a? Integer

    if @blog.nil?
      redirect_to blogs_path
    end
  end

  def privacy
  end

  def terms
  end

  def page
  end

end
