class Reservation < ActiveRecord::Base    
    
    attr_accessor :save_step
    
    validates :zip_from,   length: { minimum: 5, message: 'invalid "from" zip code' }, numericality: { only_integer: true, message: 'invalid "from" zip code' }
    validates :zip_to, length: { minimum: 5, message: 'invalid "to" zip code' }, numericality: { only_integer: true, message: 'invalid "to" zip code' }
    validates :phone_num, phone:  { possible: true, allow_blank: true, types: [:voip, :mobile], message: 'Please enter valid phone number'}
    
    before_save do
        #custome validations
        if self.reservation_number.nil? || self.reservation_number <= 0 
           self.reservation_number = 1000045 + self.id unless self.id.nil?
        end
 
        case save_step
        when :locations
        when :reservation_details  
          if self.description.nil? || self.description.empty?
            self.errors.add :base, "Please don't leave this field empty"
            false    
          end    
        when :reservation_extras
          if self.moving_date.nil? || self.moving_date < Time.now
            self.errors.add :base, "Invalid date"  
            false    
          end  
        when :contacts
           if(!is_a_valid_email?(self.email))
             self.errors.add :base, "Email address empty or invalid"
             false 
           end   
           if self.first_name.nil? || self.first_name.empty?
            self.errors.add :base, "Please enter your name"  
            false    
           end 
           if self.phone_num.nil? || self.phone_num.empty?
            self.errors.add :base, "Please enter your phone number"  
            false    
           end       
        when :thank_you_page
        end  
        
    end   
    
    def is_a_valid_email?(email)
        (email =~ /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i)
    end
    
end