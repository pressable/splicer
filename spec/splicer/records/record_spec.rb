require 'spec_helper'

describe Splicer::Records::Record do
  let(:record) { Splicer::Records::Record.new('test', 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
