require 'spec_helper'

describe Splicer::Records::ARecord do
  let(:ip) { '127.0.0.1' }
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
