require_relative "room"

class Hotel
    attr_reader (:rooms)

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each {|room_name, capacity| @rooms[room_name] = Room.new(capacity)}
    end


    def name
        name = @name.split(" ")
        new_name = []
        name.each {|ele| new_name << ele.capitalize}
        new_name.join(" ")
    end


    def room_exists?(room_name)
        @rooms[room_name] ? true : false
    end


    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end


    def has_vacancy?()
        !(@rooms.all? {|room_name, room| room.full?})
    end


    def list_rooms()
        @rooms.each do |room_name, room_class|
            puts "#{room_name}.*#{room_class.available_space}"
        end
    end

end
