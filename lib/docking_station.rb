require_relative 'bike'

class DockingStation
  attr_reader :capacity
  attr_reader :bikes
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'There are no bikes' if empty?
    @bikes.each do |bike|
      fail 'Bike is broken' if bike.broken?
    end
    @bikes.pop
  end

  def dock(bike)
    fail 'The station is full' if full?
    @bikes << bike
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.length >= @capacity
  end

  # def examine_bikes(selection)
  #   # puts "There are #{@bikes.length} bike(s) available"
  #   # puts "Which bike would you like to see?"
  #   @bikes[selection]
  # end
end
