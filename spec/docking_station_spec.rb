require 'docking_station'
require 'bike'

describe DockingStation do
  let(:bike) { double :bike }

  it { is_expected.to respond_to :release }

  it 'should release a working bike' do
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    released_bike = subject.release
    expect(released_bike).to be_working
  end

  it 'cannot release if station is empty' do
    expect { subject.release }.to raise_error "There are no bikes"
  end

  it 'should dock a bike' do
    bikes = double(:bike)
    subject.dock(bikes)
    expect(subject.bikes).to eq [bikes]
  end

  it 'cannot dock bike if full' do
    subject.capacity.times { subject.dock(double(:bike)) }
    expect { subject.dock(double(:bike)) }.to raise_error "The station is full"
  end

  describe 'broken bikes' do
    before(:each) do
      @@broken_bike = double(:bike)
      allow(@broken_bike).to receive(:working?).and_return(false)
    end

    it 'cannot be released' do
      subject.dock(@broken_bike)
      expect { subject.release }.to raise_error "Bike is broken"
    end

    it 'can be docked' do
      subject.dock(@broken_bike)
      expect(subject.bikes).to eq [@broken_bike]
    end
  end

  #
  # it 'accepts default capacity' do
  #   expect(subject)
  # end

  # it 'should examine the bike' do
  #   bike = Bike.new
  #   subject.dock(bike)
  #   selected_bike = subject.examine_bikes(0)
  #   expect(selected_bike).to eq(bike)
  # end
end
