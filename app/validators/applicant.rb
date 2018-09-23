class Applicant
  require 'uri'
  require 'net/http'
  require 'json'
  include ActiveModel::Model
  attr_accessor :email, :user_phone_number, :first_name, :last_name, :location, :position, :education, :experience, :source_info
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :user_phone_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :position, presence: true
  validates :education, presence: true
  validates :experience, presence: true
  validates :source_info, presence: true

  # Call talkpush API
  def talkpush_api(data)
    details = {
        api_key: "dbed2ab32d1e9f1453d1a321480debca",
        api_secret: "a7281c8ff4ad9d0d78ae640d4c63b64c",
        campaign_invitation: {
          first_name: data['first_name'],
          last_name: data['last_name'],
          email: data['email'],
          user_phone_number: data['user_phone_number'],
          location: data['location'], 
          position: data['position'], 
          education: data['education'], 
          experience: data['experience'], 
          source_info: data['source_info']
        }
      }

    url = URI("https://my.talkpush.com/api/talkpush_services/campaigns/4/campaign_invitations")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      @request = Net::HTTP::Post.new(url)
      @request["Content-Type"] = 'application/json'
      @request["Cache-Control"] = 'no-cache'

      @request.body = details.to_json
      response = http.request(@request) 
      valid_json?(response.read_body)
      # humanized_talkpush_msg(response.read_body) if valid_json?(response.read_body)
  end

  # VALIDATORS

  # Check if valid json
  def valid_json?(json)
      JSON.parse(json)
      return true
    rescue JSON::ParserError => e
      return false
  end

  def humanized_talkpush_msg(message) 
    if JSON.parse(message)['error']
      I18n.t 'talkpush.duplicated'
    else
      I18n.t 'talkpush.success'
    end
  end

  # Change ex. ["can't be blank", "is invalid"] to Can't be blank and is invalid
  def humanized_error(error)
    if(error.kind_of?(Array))
      full_message = error.size > 1 ? replace_last_occur(error.join(', '), ', ', ' and ') + '.' : error.first
    end
  end

  def replace_last_occur(old_str, to_rep, rep_with)
    old_str.reverse.sub(to_rep.reverse, rep_with.reverse).reverse
  end

end