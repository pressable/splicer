require 'spec_helper'

describe Splicer::Provider do
  let(:provider) { Splicer::Provider.new }
  let(:zone) { Splicer::Zone.new('rspectesting.com') }
  let(:record) { Splicer::Records::ARecord.new(nil, '127.0.0.1') }

  describe '#create_zone' do
    subject { provider.create_zone(zone) }
    it { should be_falsy }
  end

  describe '#delete_zone' do
    subject { provider.delete_zone(zone) }
    it { should be_falsy }
  end

  describe '#create_record_in_zone' do
    subject { provider.create_record_in_zone(record, zone) }
    it { should be_falsy }
  end

  describe '#update_record_in_zone' do
    subject { provider.update_record_in_zone(record, zone) }
    it { should be_falsy }
  end

  describe '#delete_record_in_zone' do
    subject { provider.delete_record_in_zone(record, zone) }
    it { should be_falsy }
  end
end
