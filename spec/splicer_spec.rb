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

end
