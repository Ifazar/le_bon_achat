class DepositsController < ApplicationController
  def show
    @user = current_user
    @product = Product.find(params[:id])
  end
end
