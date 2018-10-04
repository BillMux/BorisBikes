require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :broken? }

  it 'reports a broken bike' do
    subject.report_broken
    expect(subject).to be_broken
  end

end
