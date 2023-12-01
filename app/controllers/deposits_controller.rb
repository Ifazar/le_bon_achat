class DepositsController < ApplicationController

  def index
    @user = current_user
    @products = @user.products
    @total_price = @products.sum { |product| product.price.to_i }
    @establishments = Establishment.all
  end

  
end
