class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  before_action :set_product_params, only: %i[index show edit update destroy]
  before_action :set_user_params, only: %i[index new create edit update destroy show]

  # Si je suis connecté, je peux voir tous mes products à moi (mes annonces)
  # Déjà fait dans le pages#home non ?
  def index
    @products = @user.products
  end

  # Je peux voir le détail d'une annonce sans être connecté
  def show
    @booking = Booking.new
    if user_signed_in?
      @booked = current_user.products_through_bookings.exists?(@product.id)
    end
  end

  # Pour créer un produit je dois être connecté -> j'embarque user_id
  def new
    @product = Product.new
  end

  # Pour créer un produit je dois être connecté -> j'embarque user_id
  def create
    @product = Product.new(product_params)
    @product.user = @user
    if @product.save!
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to user_products_path(@product.user), notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # Pour supprimer un produit j'ai besoin d'être connecté
  # -> redirection vers la liste des produits de l'utilisateur connecté
  def destroy
    @product.destroy
    redirect_to # TO DO , status: :see_other
  end

  private

  def set_product_params
    @product = Product.find(params[:id])
  end

  def set_user_params
    # @user = User.find(params[:id])
    @user = current_user
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :user_id, photos: [])
  end
end
