class PagesController < ApplicationController
  def home
  	@applicant = Applicant.new
  end

  def blog
  end

  def privacy
  end

  private 

  def applicant_params
  	params.require(:applicant).permit(:email)
  end
end
