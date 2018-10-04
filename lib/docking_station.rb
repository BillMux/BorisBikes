require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    while true
      if @bikes.count > 0
        @bikes.delete(-1)
        bike = Bike.new
        return bike if bike.working?
      else
        fail "There are no bikes"
      end
    end
  end

  def dock(bike)
    if @bikes.count < @capacity
      @bikes << Bike.new
    else
      fail "This station is at capacity"
    end
  end

  def examine_bikes(selection)
    # puts "There are #{@bikes.length} bike(s) available"
    # puts "Which bike would you like to see?"
    @bikes[selection]
  end
end
