class BookingsController < ApplicationController
  protect_from_forgery except: :new
  def index
      if user_signed_in?
        user_id = User.current.id
        @bookings = Booking.where(user_id: user_id)
      end
  end


  def new
      puts current_user
      if user_signed_in?
        puts "test 2"
        booking = Booking.new
        booking.user_id = params[:id]
        booking.comments = params[:comments]
        booking.booking_date = params[:date]
        booking.customer_id = User.current.id

        if booking.save == false
          flash.now[:notice] = "Sorry there was an error"
        end
        redirect_to :back
      end
  end
end