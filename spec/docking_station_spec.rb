require 'docking_station'
require 'bike'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }
  it 'should release a bike' do
    docking_station = DockingStation.new
    expect docking_station.respond_to?('release_bike')
  end

  it 'cannot release if station is empty' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error "There are no bikes"
  end

  it 'should dock a bike' do
  bike = Bike.new
  subject.dock(bike)
  expect(subject.bikes).to eq([bike])
  end

  it 'should examine the bike' do
    bike = Bike.new
    subject.dock(bike)
    selected_bike = subject.examine_bikes(0)
    expect(selected_bike).to eq(bike)
  end
end
