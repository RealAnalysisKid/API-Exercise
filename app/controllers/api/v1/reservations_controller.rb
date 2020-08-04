class Api::V1::ReservationsController < ApiController

  def create
    @train = Train.find_by_number!( params[:train_number] )
    @reservation = Reservation.new( :train_id => @train.id,
                                    :seat_number => params[:seat_number],
                                    :customer_name => params[:customer_name],
                                    :customer_phone => params[:customer_phone] )

    if @reservation.save
      render :json => { :booking_code => @reservation.booking_code,
                        :reservation_url => api_v1_reservation_url(@reservation.booking_code) }
    else
      render :json => { :message => "订票失败", :errors => @reservation.errors }, :status => 400
    end
  end

end
