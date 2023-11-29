class ProductsController < ApplicationController
  def index
    @products = Product.all
    @establishments = Establishment.all
    @markers = @establishments.geocoded.map do |establishment|
      {
        lat: establishment.latitude,
        lng: establishment.longitude
      }
    end
  end

  def new
    @product = Product.new
  end
end
