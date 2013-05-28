class HomeController < ApplicationController
  def index
    @users = User.order(created_at: :desc).includes(:company).all
  end
end
