# frozen_string_literal: true

require 'quality'

describe Quality do
  include_context 'items'

  let(:standard_QC) { described_class.new(other) }
  let(:brie_QC) { described_class.new(brie) }
  let(:pass_QC) { described_class.new(pass) }

  describe '#update' do
    context 'for standard items' do
      it 'reduces quality by 1' do
        expect { standard_QC.update }.to change { other.quality }.by(-1)
      end

      it 'will not go lower than 0' do
        other.quality = 0
        expect { standard_QC.update }.not_to(change { other.quality })
      end

      it 'will reduce twice as fast when sell_in is below 0' do
        other.sell_in = 0
        expect { standard_QC.update }.to change { other.quality }.by(-2)
      end
    end

    context 'brie' do
      it 'increases quality by 1' do
        expect { brie_QC.update }.to change { brie.quality }.by(1)
      end

      it 'will not go higher than 50' do
        brie.quality = 50
        expect { brie_QC.update }.not_to(change { brie.quality })
      end
    end

    context 'backstage pass' do
      it 'will not go higher than 50' do
        pass.quality = 50
        expect { pass_QC.update }.not_to(change { pass.quality })
      end

      it 'increases quality by 1 for sell_in date > 10' do
        expect { pass_QC.update }.to change { pass.quality }.by(1)
      end

      it 'increases quality by 2 if sell_in date is 6..10' do
        pass.sell_in = 10
        expect { pass_QC.update }.to change { pass.quality }.by(2)
      end

      it 'increases quality by 3 if sell_in date is 0..5' do
        pass.sell_in = 5
        expect { pass_QC.update }.to change { pass.quality }.by(3)
      end

      it 'sets quality to 0 if sell_in date is negative' do
        pass.sell_in = -1
        expect { pass_QC.update }.to change { pass.quality }.to(0)
      end
    end
  end
end
