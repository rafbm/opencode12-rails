require 'uri'
require 'net/http'

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !valid? value
      record.errors[attribute] << (options[:message] || 'is not a valid URL')
    end
  end

  def self.normalize(base_url)
    return URI('') if base_url.blank?

    base_url.strip!
    base_url = "http://#{base_url}" if base_url !~ /^https?:\/\//i
    uri = URI(base_url)

    if uri.to_s == base_url
      uri.path = '/' if uri.path.blank?
      uri
    else
      URI('')
    end
  rescue URI::InvalidURIError
    URI('')
  end

private

  def valid?(base_url)
    uri = UrlValidator.normalize(base_url)
    uri.to_s.present? && uri.user.nil? && uri.password.nil? && successful_request?(uri)
  end

  def successful_request?(uri)
    Net::HTTP.new(uri.host).request_head(uri.path).code.to_i.in? 200..399
  rescue
    false
  end
end
