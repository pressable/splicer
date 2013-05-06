require 'spec_helper'

describe Splicer::Records::SRVRecord do
  let(:record) { Splicer::Records::SRVRecord.new("_sip._tcp", "sipserver.example.com", 5060, 1, 1, 300) }

  describe 'fields' do
    subject { record }
    it { should respond_to :name }
    it { should respond_to :name= }
    it { should respond_to :target }
    it { should respond_to :target= }
    it { should respond_to :port }
    it { should respond_to :port= }
    it { should respond_to :priority }
    it { should respond_to :priority= }
    it { should respond_to :weight }
    it { should respond_to :weight= }
    it { should respond_to :ttl }
    it { should respond_to :ttl= }
  end
end
