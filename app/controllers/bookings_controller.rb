class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    dates = params_booking[:ending_date].split(" to ")
    start_d = dates[0]
    end_d = dates[1]
    new_params = {starting_date: start_d, ending_date: end_d}
    @booking = Booking.new(new_params)
    @booking.user = current_user
    @product = Product.find(params[:product_id])
    @booking.product = @product
    if @booking.save!
      @booking.transaction_booked = true
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
