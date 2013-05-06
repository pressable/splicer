require 'spec_helper'

describe Splicer::Records::PTRRecord do
  let(:record) { Splicer::Records::PTRRecord.new('test', 'server.example.com', 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :host }
    it { should respond_to :host= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
