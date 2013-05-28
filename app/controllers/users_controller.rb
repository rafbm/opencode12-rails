class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
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
end
