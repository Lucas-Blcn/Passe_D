class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params_booking)
    @booking.user = current_user
    @product = Product.find(params[:product_id])
    @booking.product = @product
    if @booking.save!
      redirect_to product_path(@product)
    else
      render "products/show", status: :unprocessable_entity
    end
  end

  private

  def params_booking
    params.require(:booking).permit(:starting_date, :ending_date)
  end
end
