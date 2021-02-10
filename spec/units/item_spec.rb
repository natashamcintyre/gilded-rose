# frozen_string_literal: true

require 'item'

describe Item do
  subject { described_class.new('name', 'sellin', 'quality') }
  describe '#to_s' do
    it 'converts item to string name, sellin, quality' do
      expect(subject.to_s).to eq 'name, sellin, quality'
    end
  end
end
