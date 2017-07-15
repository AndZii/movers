class MoversController < ApplicationController
  
  before_action :set_new_reservation_session  
    
  def set_new_reservation_session    
    session[:reservation_id] = nil 
  end      
    
  def index
  end

  def contacts
  end

  def services
  end

  def gallery
  end

  def about
  end
end
