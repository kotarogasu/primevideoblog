class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @products = user.products.order("created_at DESC").page(params[:page]).per(8)
  end
end
