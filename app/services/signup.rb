class Signup
  include ActiveModel::Model

  # Attributes
  def user
    @user ||= User.new
  end
  def user=(params = {})
    user.attributes = params.permit(:email, :password, :password_confirmation)
  end

  def company
    @company ||= Company.new
  end
  def company=(params = {})
    company.attributes = params.permit(:name, :website)
  end

  # Validations
  validates_each :user, :company do |record, attribute, instance|
    record.errors.add(attribute, instance.errors.full_messages) if instance.invalid?
  end

  # Persistence
  def save
    user.company = company

    if valid?
      if ActiveRecord::Base.transaction { user.save && company.save }
        Notifier.new_signup(user).deliver
        true
      else
        errors[:base] << 'There was an error on our hand. Please try again.'
        false
      end
    else
      false
    end
  end
end
