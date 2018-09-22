class Applicant
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


  # VALIDATORS
  # protected
  # Check if valid json
  def valid_json?(json)
      JSON.parse(json)
      return true
    rescue 
    # rescue JSON::ParserError => e
      return false
  end

  def talkpush(message) 
    if JSON.parse(message)['error']
      t 'duplicated'
    else
      t 'success'
    end
  end

  # Change a hash of errors to a human friendly format
  def humanized_errors(errors)
    full_message = ''
    errors.each do |e|
      full_message += e.first.humanize + ' ' + replace_last_occur(e.last.join(', '), ', ', ' and ') + '.<br>'
    end
    full_message.html_safe
  end

  # Change ex. ["can't be blank", "is invalid"] to Can't be blank and is invalid
  def humanized_error(error)
    full_message = replace_last_occur(error.join(', '), ', ', ' and ') + '.'
    full_message.capitalize.html_safe
  end

  def replace_last_occur(old_str, to_rep, rep_with)
    old_str.reverse.sub(to_rep.reverse, rep_with.reverse).reverse
  end

end