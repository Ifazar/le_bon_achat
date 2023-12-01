class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'Utilisateur créé avec succès!'
    else
      render :new
    end
  end
  
  def increment
    @ticket = Ticket.find(params[:id])
    @user = current_user
    @products = @user.products
    @products.update_all(ticket_id: @ticket.last + 1)
    redirect_to user_path, notice: 'Ticket créé avec succès.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
