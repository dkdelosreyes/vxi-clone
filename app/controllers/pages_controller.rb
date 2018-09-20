
class PagesController < ApplicationController
	require 'uri'
	require 'net/http'
	require 'json'

  def home
  	@applicant = Applicant.new
  end

  def signup_vxi
  	# TODO: clean
  	@data = params['applicant']
		@applicant = Applicant.new(
				email: @data['email'], 
				user_phone_number: @data['user_phone_number'], 
				first_name: @data['first_name'], 
				last_name: @data['last_name'], 
				location: @data['location'], 
				position: @data['position'], 
				education: @data['education'], 
				experience: @data['experience'], 
				source_info: @data['source_info']
			)

  	if @applicant.valid?
  		details = {
  			'api_key': "dbed2ab32d1e9f1453d1a321480debca",
			  'api_secret': "a7281c8ff4ad9d0d78ae640d4c63b64c",
			  'campaign_invitation': {
					'first_name': @data['first_name'],
					'last_name': @data['last_name'],
					'email': @data['email'],
					'user_phone_number': @data['user_phone_number'],
					'location': @data['location'], 
					'position': @data['position'], 
					'education': @data['education'], 
					'experience': @data['experience'], 
					'source_info': @data['source_info']
				}
			}

	  	@url = URI("https://my.talkpush.com/api/talkpush_services/campaigns/4/campaign_invitations")

			@http = Net::HTTP.new(@url.host, @url.port)
			@http.use_ssl = true
			@http.verify_mode = OpenSSL::SSL::VERIFY_NONE

			@request = Net::HTTP::Post.new(@url)
			@request["Content-Type"] = 'application/json'
			@request["Cache-Control"] = 'no-cache'

			# details = {api_key: "dbed2ab32d1e9f1453d1a321480debca",
			#     api_secret: "a7281c8ff4ad9d0d78ae640d4c63b64c",
			#     campaign_invitation: {
			#       first_name: "John",
			#       last_name: "Peters",
			#       email: "dkdelosreyes6@gmail.com",
			#       user_phone_number: "09999999996"
			#     }
			#   }

			@request.body = details.to_json
			@response = @http.request(@request)
  		flash[:info] = @response.read_body
  	else
  		flash[:info] = @applicant.errors
  	end

		redirect_to root_path
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
