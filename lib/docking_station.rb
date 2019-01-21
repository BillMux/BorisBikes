require_relative 'bike'

class DockingStation
  attr_reader :capacity
  attr_accessor :bikes
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release
    fail 'There are no bikes' if empty?
    @bikes.each do |bike|
      fail 'Bike is broken' if bike.working? == false
    end
    @bikes.pop
  end

  def dock(bike, working = true)
    fail 'The station is full' if full?
    @bikes << bike
    bike.report_broken if working == false
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.length == @capacity
  end
end
