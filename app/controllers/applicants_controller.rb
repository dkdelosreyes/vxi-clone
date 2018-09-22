class ApplicantsController < ApplicationController
	def signup_vxi
  	data = params['applicant']
		@applicant = Applicant.new(
				email: data['email'], 
				user_phone_number: data['user_phone_number'], 
				first_name: data['first_name'], 
				last_name: data['last_name'], 
				location: data['location'], 
				position: data['position'], 
				education: data['education'], 
				experience: data['experience'], 
				source_info: data['source_info']
			)

  	if @applicant.valid?
  		flash[:info] = @applicant.talkpush_api(data)
  	else
  		flash[:errors] = @applicant.errors if @applicant.errors.any?
  	end

		redirect_to root_path
  end
end
