require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe Van do
  before(:each) do
    station = DockingStation.new
    @bike = Bike.new
    station.dock(@bike, working = false)
  end

  it 'is empty before pickups' do
    expect(subject.hold).to be_empty
  end

  it 'picks up broken bikes' do
    subject.collect
    expect(subject.hold).to eq([@bike])
  end
end
