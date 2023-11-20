class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  before_action :set_product_params [:index, :show, :create, :destroy]
  before_action :set_user_params [:index, :new, :create, :destroy]

  # Si je suis connecté, je peux voir tous mes products à moi (mes annonces)
  def index
    @user = current_user
    @products = @user.products
  end

  # Je peux voir le détail d'une annonce sans être connecté
  def show
  end

  # Pour créer un produit je dois être connecté -> j'embarque user_id
  def new
    @product = Product.new
  end

  # Pour créer un produit je dois être connecté -> j'embarque user_id
  def create
    @user = current_user
    @product = Product.new(product_params)
    @product.user.user_id = @user.id
    @product.save!
    redirect_to user_products_path(@user)
  end

  # Pour supprimer un produit j'ai besoin d'être connecté -> redirection vers la liste des produits de l'utilisateur connecté
  def destroy
    @product.destroy
    redirect_to #TO DO , status: :see_other
  end

  private

  def set_product_params
    @product.find(params[:id])
  end

  def set_user_params
    @user.find(params[:id])
  end

  def product_params
    params.require(:product).permit(title:, description:, price:, user_id:)
  end
end
