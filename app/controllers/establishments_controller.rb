class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
    @products = Product.all

    @marker =
      {
        lat: @establishment.latitude,
        lng: @establishment.longitude
      }
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
