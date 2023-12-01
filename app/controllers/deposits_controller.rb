class DepositsController < ApplicationController

  def index
    @user = current_user
    @products = @user.products
    @total_price = @products.sum { |product| product.price.to_i }
    @tickets = Ticket.all
    @establishments = Establishment.all
    @establishments.drop(1)

    @marker = @establishments.geocoded.map do |establishment|
      {
        lat: establishment.latitude,
        lng: establishment.longitude
      }
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to deposits_path, status: :see_other

  end


end
