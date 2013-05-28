require 'resolv'
require 'timeout'

class EmailValidator < ActiveModel::EachValidator
  REGEX = /\A
    [^\s@]+ # non-at-sign characters, at least one
      @     # at-sign
    [^\s.@] # non-at-sign and non-period character
    [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
     \.     # period
    [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
    [^\s.@] # non-at-sign and non-period character
  \z/x

  def validate_each(record, attribute, value)
    if !valid? value
      record.errors[attribute] << (options[:message] || 'is not a valid email')
    end
  end

private

  def valid?(address)
    address  = address.to_s.strip
    hostname = address.split('@').last

    address =~ REGEX && email_host?(hostname)
  end

  def email_host?(hostname)
    Timeout::timeout(2) do
      !!Resolv::DNS.new.getresource(
        Resolv::DNS::Name.create(hostname),
        Resolv::DNS::Resource::IN::MX,
      )
    end
  rescue Resolv::ResolvError, Timeout::Error
    false
  end
end
