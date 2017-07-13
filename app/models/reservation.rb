class Reservation < ActiveRecord::Base
    validates :zip_from,   length: { minimum: 5, message: 'invalid "from" zip code' }
    validates :zip_to, length: { minimum: 5, message: 'invalid "to" zip code' }
    
    
    before_save do
        if self.reservation_number.nil? || self.reservation_number <= 0 
           self.reservation_number = 1000045
        end    
    end    
end
