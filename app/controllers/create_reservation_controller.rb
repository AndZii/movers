class CreateReservationController < ApplicationController
  include Wicked::Wizard
  steps :locations, :reservation_details, :reservation_extras, :contacts, :thank_you_page
    
  before_action :init_view_data
    
  def init_view_data
    @form_size_class = "col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1"
      
    case step    
        when :locations
        @panel_title = "Location"
        when :reservation_details
        @panel_title = "Details"
        when :reservation_extras
        @panel_title = "Options"
        when :contacts
        @panel_title = "Contacts"
        when :thank_you_page
        @panel_title = "Summary"
    end  
  end      
    
  def show
      if      step == :locations || 
              session[:reservation_id].nil? ||
              session[:reservation_id] <= 0
          @reservation = Reservation.new 
          session[:reservation_id] = nil
      else
          @reservation = Reservation.find(session[:reservation_id]) 
      end
    case step    
        when :locations
        @panel_title = "Location"
        when :reservation_details
        @panel_title = "Details"
        when :reservation_extras
        @panel_title = "Options"
        when :contacts
        @panel_title = "Contacts"
        when :thank_you_page
        @panel_title = "Summary"
    end
      
    render_wizard
  end
   
  def update  
    params.require(:reservation).permit!
    
    if params[:reservation][:id].empty?  
        @reservation = Reservation.new
    else
        @reservation = Reservation.find(params[:reservation][:id])  
    end  
      
      case step
        when :locations
            @reservation.zip_to   = params[:reservation][:zip_to]
            @reservation.zip_from = params[:reservation][:zip_from]
        when :reservation_details
            
        when :reservation_extras
      
        when :contacts
            @reservation.email     = params[:reservation][:email]
            @reservation.phone_num = params[:reservation][:phone_num]
        when :thank_you_page
      
    end  
      
    if @reservation.save  
      session[:reservation_id] = @reservation.id
    end
      
    render_wizard(@reservation)
  end    
end
