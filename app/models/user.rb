class User < ActiveRecord::Base
  # Validations
  validates :email, email: true, uniqueness: { case_sensitive: false }

  # Misc
  has_secure_password
end
