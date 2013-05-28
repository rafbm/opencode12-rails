class UsersController < ApplicationController
  def new
    @user = User.new
    @company = Company.new
  end

  def create
    @user = User.new(user_params)
    @company = Company.new(company_params)

    @user.company = @company

    valid = true
    valid = false if !@user.valid?
    valid = false if !@company.valid?

    if valid
      @user.save
      @company.save

      Notifier.new_signup(@user).deliver
      redirect_to root_path,
        notice: "Successfully signed up as <b>#{@user.email}</b>!".html_safe
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def company_params
    params.require(:company).permit(:name, :website)
  end
end
