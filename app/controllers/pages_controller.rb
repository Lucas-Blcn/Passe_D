class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :welcome]

  # Je peux voir tous les produits proposés par la plateforme SANS être connecté
  def home
    @products = Product.all
    if params[:query].present?
      @products = @products.where("title ILIKE ?", "%#{params[:query]}%").reverse

    end
  end

  def welcome
  end
end
