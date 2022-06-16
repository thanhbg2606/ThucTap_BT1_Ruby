module Price 
    def min_ticket_need_sell
        "You need sell at least 100 ticket to fly"
    end
end

class Plane 
    extend Price

    MAX_SPEED = 913

    def initialize a
        @attendant_num = a      
    end    

    def flight_attendant
        puts "In flight have #{@attendant_num} attendant"
    end

    def self.max_fly_speed
        printf "#{MAX_SPEED} km/h";
    end
end

def run
    vietnam_airline = Plane.new(10)
    vietnam_airline.flight_attendant
    
    vietjet  = Plane.new 20
    vietjet.flight_attendant
    
    puts Plane.max_fly_speed
    puts Plane.min_ticket_need_sell
end

run()







