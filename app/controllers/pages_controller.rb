class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # Je peux voir tous les produits proposés par la plateforme SANS être connecté
  def home
    @products = Product.all
  end

  def welcome
  end
end
