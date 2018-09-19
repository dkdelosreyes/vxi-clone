class PagesController < ApplicationController
 #  require 'uri'
	# require 'net/http'

  def home

  # 	@url = URI("https://my.talkpush.com/api/talkpush_services/campaigns/4/campaign_invitations")

		# @http = Net::HTTP.new(@url.host, @url.port)
		# @http.use_ssl = true
		# @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		# @request = Net::HTTP::Post.new(@url)
		# @request["Content-Type"] = 'application/json'
		# @request["Cache-Control"] = 'no-cache'
		# @request.body = '{
		#     "api_key": "dbed2ab32d1e9f1453d1a321480debca",
		#     "api_secret": "a7281c8ff4ad9d0d78ae640d4c63b64c",
		#     "campaign_invitation": {
		#       "first_name": "John",
		#       "last_name": "Peters",
		#       "email": "dianne.delosreyes@nchcss.com",
		#       "user_phone_number": "09455027432"
		#     }
		#   }'
		# @response = @http.request(@request)

  end

  def blog
  end

  def privacy
  end
end
