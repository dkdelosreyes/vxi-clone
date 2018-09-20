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

end