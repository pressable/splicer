require 'spec_helper'

describe Splicer::Records::MXRecord do
  let(:record) { Splicer::Records::MXRecord.new('example.com', "mx.another.com", 10, 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :exchanger }
    it { should respond_to :exchanger= }
    it { should respond_to :priority }
    it { should respond_to :priority= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
