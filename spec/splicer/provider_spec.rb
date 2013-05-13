require 'spec_helper'

describe Splicer::Provider do
  let(:provider) { Splicer::Provider.new }
  let(:zone) { Splicer::Zone.new('example.com') }
  let(:record) { Splicer::Records::Record.new('name',123) }

  describe '#create_zone' do
    subject { provider.create_zone(zone) }
    it { should eq(false) }
  end

  describe '#update_zone' do
    subject { provider.update_zone(zone) }
    it { should eq(false) }
  end

  describe '#rewrite_zone' do
    subject { provider.rewrite_zone(zone) }
    it { should eq(false) }
  end

  describe '#delete_zone' do
    subject { provider.delete_zone(zone) }
    it { should eq(false) }
  end

  describe '#delete_record_in_zone' do
    subject { provider.delete_record_in_zone(record, zone) }
    it { should eq(false) }
  end

  describe '#update_record_in_zone' do
    subject { provider.update_record_in_zone(record, zone) }
    it { should eq(false) }
  end

  describe '#create_record_in_zone' do
    subject { provider.create_record_in_zone(record, zone) }
    it { should eq(false) }
  end
end
