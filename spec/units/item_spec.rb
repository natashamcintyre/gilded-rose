# frozen_string_literal: true

require 'item'

describe Item do
  subject { described_class.new('name', 'sell_in', 'quality') }
  describe '#to_s' do
    it 'converts item to string name, sell_in, quality' do
      expect(subject.to_s).to eq 'name, sell_in, quality'
    end
  end
end
