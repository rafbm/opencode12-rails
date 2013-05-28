class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to root_path, notice: @signup.success_message
    else
      render 'new'
    end
  end

private

  def signup_params
    params.require(:signup).permit!
  end
end
