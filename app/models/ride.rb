class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user
    
    
    def take_ride
        message = "Sorry."
        if user.tickets < attraction.tickets
            message+=" You do not have enough tickets to ride the #{attraction.name}."
        end
        if user.height < attraction.min_height
            message+=" You are not tall enough to ride the #{attraction.name}."
        end
        if good_ride?
            update_user
        else
            return message
        end
    end
    
    def update_user
        user.tickets -=attraction.tickets
        user.nausea += attraction.nausea_rating
        user.happiness +=attraction.happiness_rating
        user.save
    end
    
     def good_ride?
        user.tickets >= attraction.tickets && user.height >= attraction.min_height
     end
     

end
