require 'spec_helper'

describe Splicer::Configuration do
  let(:config) { Splicer::Configuration.new }

  describe 'fields' do
    it { should respond_to :providers }
  end

  describe '#initialize' do
    subject { config }
    its(:providers) { should eq({}) }
  end

  describe '#register' do
    let(:one_dns) { double('Splicer::OneDNS', name: :one_dns) }
    let(:two_dns) { double('Splicer::TwoDNS', name: :two_dns) }

    context 'when one provider is registered' do
      subject { config.register(one_dns) }
      it { should eq(true) }
    end
    context 'when two providers are registered' do
      before { config.register(one_dns) }
      subject { config.register(two_dns) }
      it { should eq(true) }
    end
    context 'when two of the same providers are registered' do
      before { config.register(one_dns) }
      subject { config.register(one_dns) }
      it { should eq(true) }
    end
    context 'when an object does not implement name' do
      subject { config.register(Object.new) }
      it { should eq(false) }
    end
  end

  describe '#provider' do
    let(:one_dns) { double('Splicer::OneDNS', name: :one_dns) }

    context 'when the provider exists' do
      before { config.register(one_dns) }
      subject { config.provider(one_dns.name) }
      it { should eq(one_dns) }
    end
    context 'when the provider does not exist' do
      subject { config.provider(one_dns.name) }
      it { should eq(nil) }
    end
  end
end
