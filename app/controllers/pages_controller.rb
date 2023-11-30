class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

    @products = Product.all
    @establishments = Establishment.all
    @markers = @establishments.geocoded.map do |establishment|
      {
        lat: establishment.latitude,
        lng: establishment.longitude
      }
    end
  end
end
