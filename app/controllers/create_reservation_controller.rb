class CreateReservationController < ApplicationController
  include Wicked::Wizard
  steps :locations, :reservation_extras, :reservation_details, :contacts, :thank_you_page
    
  before_action :init_view_data
    
  def init_view_data
    @form_size_class = "col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1"
      
    @locations_completed  = "disabled" 
    @options_completed    = "disabled"
    @details_completed    = "disabled"
    @contacts_completed   = "disabled"  
      
    case step    
        when :locations
        @panel_title = "Location"
        @locations_completed  = "active"
        when :reservation_extras
        @panel_title = "Options"
        @locations_completed  = "complete"
        @options_completed    = "active"
        when :reservation_details
        @locations_completed  = "complete"
        @options_completed    = "complete"
        @details_completed    = "active"
        @panel_title = "Details"
        when :contacts
        @panel_title = "Contacts"
        @locations_completed  = "complete"
        @options_completed    = "complete"
        @details_completed    = "complete"
        @contacts_completed   = "complete"
        when :thank_you_page
        @locations_completed  = "complete"
        @options_completed    = "complete"
        @details_completed    = "complete"
        @contacts_completed   = "complete"
        @panel_title = "Summary"
    end  
  end      
    
  def show
      if session[:reservation_id].nil? ||
              session[:reservation_id] <= 0
          @reservation = Reservation.new 
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
    
    puts params  
      
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
            @reservation.description   = params[:reservation][:description]
        when :reservation_extras
            date = params[:reservation][:moving_date]
            date.sub!('/', '-')
            @reservation.moving_date   = date
            @reservation.home_type   = params[:reservation][:home_type].to_s
        when :contacts
            @reservation.first_name= params[:reservation][:first_name]
            @reservation.email     = params[:reservation][:email]
            @reservation.phone_num = params[:reservation][:phone_num]
        when :thank_you_page
      
    end  
      
    if @reservation.save  
      session[:reservation_id] = @reservation.id
        puts @reservation.moving_date.to_s + " . " + @reservation.home_type.to_s
      puts "saved"
    else
      puts "not saved"    
    end
      
    render_wizard(@reservation)
  end    
end
