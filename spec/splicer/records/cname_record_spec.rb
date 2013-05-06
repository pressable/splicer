require 'spec_helper'

describe Splicer::Records::CNAMERecord do
  let(:record) { Splicer::Records::CNAMERecord.new('test', 'example.com', 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :cname }
    it { should respond_to :cname= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
