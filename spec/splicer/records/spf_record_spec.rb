require 'spec_helper'

describe Splicer::Records::SPFRecord do
  let(:record) { Splicer::Records::SPFRecord.new('example.com', 'v=spf1 a mx include:_spf.google.com ~all', 300) }

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
