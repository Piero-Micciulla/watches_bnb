class BookingsController < ApplicationController
   before_action :find_booking, only: [:show, :edit, :destroy]
   before_action :authenticate_user!

  def dashboard
    @user_bookings = current_user.bookings
    @bookings = Booking.all
    @disable_navbar = true
  end

  def show
    @booking
  end

  def new
    @booking = Booking.new
    @watch = Watch.find(params[:watch_id])
    @marker = [{
      lat: @watch.user.latitude,
      lng: @watch.user.longitude,
      image_url: helpers.asset_url('map_logo_2.jpg')
    }]
  end

  def create
    @booking = Booking.new(strong_params)
    @watch = Watch.find(params[:watch_id])
    @booking.user = current_user
    @booking.watch = @watch
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @booking
  end

  def update
    @booking
    @booking.update(strong_params)
    redirect_to dahsboard_path
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
