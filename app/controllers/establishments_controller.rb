class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
    @establishments.drop(1)
    @products = Product.all

    @marker = @establishments.geocoded.map do |establishment|
      {
        lat: establishment.latitude,
        lng: establishment.longitude
      }
    end
  end

  def show
    @establishment = Establishment.find(params[:id])
    @products = @establishment.products
    @marker =
      {
        lat: @establishment.latitude,
        lng: @establishment.longitude
      }
  end
end
