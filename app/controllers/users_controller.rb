class UsersController < ApplicationController
  def index
    # @user = current_user
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @ticket = Ticket.find(params[:id])
    @products = @user.products
    @tickets = @user.tickets
    # @establishment = Establishment.find(params[:id])

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
    @products = current_user.products
    @total_price = @products.select {|product| product.ticket_id == 1}.sum { |product| product.price.to_i }
    @ticket = Ticket.new(color: "Green", user: current_user, price: @total_price)

    if @ticket.save
      @products.select {|product| product.ticket_id == 1}.each do |product|
        product.update(ticket_id: @ticket.id)
      end
      redirect_to user_path(current_user), notice: 'Ticket créé avec succès.'
    else
      render :show, status: :unprocessable_entity
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
