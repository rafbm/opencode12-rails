class Company < ActiveRecord::Base
  # Associations
  has_many :users

  # Validations
  validates :website, url: true, allow_blank: true
end
