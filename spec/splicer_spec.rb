require 'spec_helper'

describe Splicer do
  let(:provider) { double('Splicer::Provider', name: :someone) }
  let(:another) { double('Splicer::Another', name: :another) }

  describe '.configure' do
    it "should accept a block" do
      Splicer.configure do |config|
        @config = config
      end
      expect(@config).to be_a(Splicer::Configuration)
      @config = nil
    end
  end

  describe '.configuration' do
    subject { Splicer.providers }

    context 'when no configurations are present' do
      before do
        Splicer.configure do |config|
        end
      end
      it { should eq([]) }
    end

    context 'when a configuration is present' do
      let(:one_provider) { double('Splicer::OneDNS::Provider')}
      let(:one_dns) { double('Splicer::OneDNS', provider: one_provider) }
      before do
        Splicer.configure do |config|
          config.register(one_dns)
        end
      end
      it { should eq([one_provider]) }
    end
  end

end
