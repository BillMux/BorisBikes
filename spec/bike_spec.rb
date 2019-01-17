require_relative '../lib/bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it 'reports a broken bike' do
    subject.report_broken
    expect(subject.working?).to eq false
  end

end
