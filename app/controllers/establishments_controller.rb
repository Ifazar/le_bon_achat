class EstablishmentsController < ApplicationController
  def index
    @establishments = Establishment.all
    @products = Product.all
  end

  def show
    @establishment = Establishment.find(params[:id])
    @products = @establishment.products
  end
end
