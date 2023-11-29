class ProductsController < ApplicationController
  def index
    @products = Product.all
    @establishments = Establishment.all
  end

  def new
    @product = Product.new
  end
end
