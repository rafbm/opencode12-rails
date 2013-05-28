class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to root_path,
        notice: "Successfully signed up as <b>#{@signup.user.email}</b>!".html_safe
    else
      render 'new'
    end
  end

private

  def signup_params
    params.require(:signup).permit!
  end
end
