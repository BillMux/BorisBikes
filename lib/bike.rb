class Bike

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def broken?
    @broken
  end

  def report_broken
    @broken = true
  end

end
