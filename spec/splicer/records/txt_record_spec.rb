require 'spec_helper'

describe Splicer::Records::TXTRecord do
  let(:record) { Splicer::Records::TXTRecord.new('example.com', 'google-site-verification=vEj1ZcGtXeM_UEjnCqQEhxPSqkS9IQ4PBFuh48FP8o4', 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :text }
    it { should respond_to :text= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
