require 'spec_helper'

describe Splicer::Zone do
  let(:zone) { Splicer::Zone.new('example.com') }

  describe 'fields' do
    subject { zone }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :records }
  end

  describe '#initialize' do
    subject { zone }
    its(:name) { should eq('example.com') }
    its(:records) { should eq([]) }
  end

  describe '#add_record' do
    let(:record) { double('ARecord') }

    it "should add the record" do
      expect { zone.add_record(record) }.to change(zone.records, :count).by(1)
    end
  end

  describe '#add_records' do
    let(:cname_record) { double('CNAMERecord') }
    let(:a_record) { double('ARecord') }

    it "should add the records" do
      expect { zone.add_records([a_record, cname_record]) }.to change(zone.records, :count).by(2)
    end
  end

  describe '#publish' do
    subject { zone.publish(:merge) }
    it { should eq(true) }
  end

end
