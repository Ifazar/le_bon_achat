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

  def confirme
    @establishment = Establishment.find(params[:id])
    @user = current_user
    @products = @user.products
    @products.update_all(establishment_id: @establishment.id)
    redirect_to deposits_path, notice: 'Etablissement selectionné avec succès.'
  end

end
