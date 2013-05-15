require 'spec_helper'

describe Splicer::NullObject do
  describe '#initialize' do
    it 'should initialize' do
      expect { Splicer::NullObject.new('a', 1, Object.new ) }.to_not raise_error(StandardError)
    end
  end

  describe '#method_missing' do
    let(:null) { Splicer::NullObject.new }
    context 'when calling #info' do
      subject { null.info('something') }
      it { should be_a(Splicer::NullObject) }
    end
    context 'when calling #debug' do
      subject { null.debug('something') }
      it { should be_a(Splicer::NullObject) }
    end
    context 'when calling #error' do
      subject { null.error('something') }
      it { should be_a(Splicer::NullObject) }
    end
    context 'when calling #warn' do
      subject { null.warn('something') }
      it { should be_a(Splicer::NullObject) }
    end
    context 'when calling #fatal' do
      subject { null.fatal('something') }
      it { should be_a(Splicer::NullObject) }
    end
  end
end
