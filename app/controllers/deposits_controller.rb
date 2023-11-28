class DepositsController < ApplicationController
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
    params.require(:product).permit(:title, :category, :detail, :condition, :price)
  end

  def price
    
    if product.condition == "Très Bon"
      if product.category == "Divertissement"
        puts "7"
      elsif product.category == "Electrique" || "Sport"
        puts "30"
      else product.category == "Mobilier" || "Jardinage"
        puts "20"
      end
    elsif product.condition == "Bon"
      if product.category == "Divertissement"
        puts "4"
      elsif product.category == "Electrique" || "Sport"
        puts "20"
      else product.category == "Mobilier" || "Jardinage"
        puts "15"
      end
    elsif product.condition == "Moyen"
      if product.category == "Divertissement"
        puts "2"
      elsif product.category == "Electrique" || "Sport"
        puts "15"
      else product.category == "Mobilier" || "Jardinage"
        puts "10"
      end
    else product.condition == "Usagé"
      if product.category == "Divertissement"
        puts "1"
      elsif product.category == "Electrique" || "Sport"
        puts "10"
      else product.category == "Mobilier" || "Jardinage"
        puts "5"
      end
    end
  end

end
