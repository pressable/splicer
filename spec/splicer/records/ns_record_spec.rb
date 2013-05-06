require 'spec_helper'

describe Splicer::Records::NSRecord do
  let(:record) { Splicer::Records::NSRecord.new('test', 'ns1.dns.com', 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :server }
    it { should respond_to :server= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
