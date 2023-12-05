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
    @establishments = Establishment.all
    @products = @establishment.products

    @marker = @establishments.geocoded.map do |establishment|
        {
          lat: @establishment.latitude,
          lng: @establishment.longitude
        }
    end
  end

  def confirme
    @establishment = Establishment.find(params[:id])
    @user = current_user
    @products = @user.products
    @products.update_all(establishment_id: @establishment.id)
    redirect_to deposits_path, notice: 'Etablissement selectionné avec succès.'
  end

end
