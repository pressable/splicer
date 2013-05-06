require 'spec_helper'

describe Splicer do
  let(:provider) { double('Splicer::Provider', name: 'someone') }
  let(:another) { double('Splicer::Provider', name: 'another') }

  describe '.configure' do
    it "should accept a block" do
      expect {
        Splicer.configure do |config|
        end
      }.to_not raise_error(StandardError)
    end
  end

  describe '.register' do
    it "should register a provider" do
      Splicer.register(provider)
      expect(Splicer.providers.count).to eq(1)
    end
    it "should register more than one provider" do
      Splicer.register(provider)
      Splicer.register(another)
      expect(Splicer.providers.count).to eq(2)
    end
  end

  describe '.provider' do
  end

end
