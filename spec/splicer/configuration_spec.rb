require 'spec_helper'

describe Splicer::Configuration do
  let(:config) { Splicer::Configuration.new }

  describe 'fields' do
    it { should respond_to :providers }
  end

  describe '#initialize' do
    subject { config }
    its(:providers) { should eq([]) }
  end

  describe '#register' do
    let(:provider) { double('Splicer::SomeProvider') }
    subject { config.register(provider) }
    it { should eq([provider]) }
  end

  describe '#providers' do
    let(:one_provider) { double('Splicer::OneDNS::Provider')}
    let(:two_provider) { double('Splicer::TwoDNS::Provider')}
    let(:one_dns) { double('Splicer::OneDNS', provider: one_provider) }
    let(:two_dns) { double('Splicer::TwoDNS', provider: two_provider) }
    before do
      config.register(one_dns)
      config.register(two_dns)
    end
    subject { config.providers }
    it { should eq([one_provider, two_provider])}
  end
end
