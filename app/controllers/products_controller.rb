class ProductsController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.establishment = Establishment.first
    @product.ticket = Ticket.first
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @product = Product.find(params[:id])
  #   @product.destroy
  #   redirect_to product_path(@product), status: :see_other
  # end

  private

  def product_params
    params.require(:product).permit(:title, :category, :detail, :condition, :price, :picture1, :picture2, :picture3)
  end
end
