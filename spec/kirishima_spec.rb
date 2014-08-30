require 'spec_helper'

describe Kirishima do
  describe '#main' do
    specify do
      expect(Kirishima.new.main).to eq 1
    end
  end
end