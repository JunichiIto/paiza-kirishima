require 'spec_helper'

describe Kirishima do
  describe '#main' do
    context 'sample 1' do
      let(:programmer_count) { 60 }
      let(:offers) { [[40, 4300], [30, 2300], [20, 2400]].map{|values| Offer.new(*values)} }
      specify do
        expect(Kirishima.new.main(programmer_count, offers)).to eq 6600
      end
    end
    context 'sample 2' do
      let(:programmer_count) { 250 }
      let(:offers) { [[35, 3640], [33, 2706], [98, 9810], [57, 5472], [95, 7790]].map{|values| Offer.new(*values)} }
      specify do
        expect(Kirishima.new.main(programmer_count, offers)).to eq 23072
      end
    end
  end
end