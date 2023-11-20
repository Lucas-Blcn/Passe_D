class UsersController < ApplicationController
  # Afficher toutes les réservations d'un utilisateur s'il est connecté
  def index
    @user = current_user
    @bookings = @user.bookings
  end

  # Afficher le détails des réservations d'un utilisateur s'il est connecté
  def show
    @user = current_user
    @booking = Booking.find(params[:id])
  end
end
