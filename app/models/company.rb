class Company < ActiveRecord::Base
  # Associations
  has_many :users

  # Validations
  validates :website, url: true, allow_blank: true

  def website_url
    UrlValidator.normalize(website).to_s
  end

  def website_host
    UrlValidator.normalize(website).host
  end
end
