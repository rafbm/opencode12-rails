class User < ActiveRecord::Base
  # Associations
  belongs_to :company

  # Validations
  validates :email, email: true, uniqueness: { case_sensitive: false }

  # Misc
  has_secure_password
end
