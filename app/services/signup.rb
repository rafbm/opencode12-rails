class Signup < Service
  # Attributes
  associate :user, permit: [:email, :password, :password_confirmation]
  associate :company, permit: [:name, :website]

  # Persistence
  def save
    user.company = company

    return false if invalid?

    if transaction { user.save && company.save }
      Notifier.new_signup(user).deliver
      true
    else
      errors[:base] << 'There was an error on our end. Please try again.'
      false
    end
  end

  # Messages
  def success_message
    "Successfully signed up as <b>#{user.email}</b>!".html_safe
  end
end
