require 'spec_helper'

describe Splicer::Records::AAAARecord do
  let(:ip) { '2607:f0d0:1002:0051:0000:0000:0000:0004' }
  let(:record) { Splicer::Records::ARecord.new('test', ip, 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :ip }
    it { should respond_to :ip= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
