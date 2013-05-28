class Notifier < ActionMailer::Base
  default from: 'OpenCode <info@opencode.ca>'

  def new_signup(user)
    @user = user
    mail to: @user.email
  end
end
