# frozen_string_literal: true

require 'gilded_rose'
require_relative '../support/doubles.rb'

describe GildedRose do
  include_context 'item_doubles'

  subject { described_class.new(items) }

  context 'for standard items:' do
    describe '#update_quality' do
      it 'does not change the name' do
        expect { subject.update_quality }.not_to change { other.name }
      end

      it 'decreases quality by 1' do
        expect { subject.update_quality }.to change { other.quality }.by(-1)
      end

      it 'decreases sell_in by 1' do
        expect { subject.update_quality }.to change { other.sell_in }.by(-1)
      end
    end
  end

  context 'for aged brie' do
    describe '#update_quality' do
      it 'increases quality by 1' do
        expect { subject.update_quality }.to change { brie.quality }.by(1)
      end

      it 'decreases sell_in by 1' do
        expect { subject.update_quality }.to change { brie.sell_in }.by(-1)
      end
    end
  end

  context 'for sulfuras' do
    describe '#update_quality' do
      
    end
  end
end
