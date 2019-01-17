require_relative '../lib/docking_station'
require_relative '../lib/bike'

class Van
  attr_reader :hold

  def initialize
    @hold = []
  end

  def collect
    for x in 0..@bikes.length
      @hold.push(@bikes[x].pop) if @bikes[x].working? == false
    end
  end
end
