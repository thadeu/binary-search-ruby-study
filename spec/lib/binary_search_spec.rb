require 'spec_helper'

RSpec.describe BinarySearch do
  describe '#search' do
    it 'should find the index of the target value' do
      arr = (0..1000).to_a

      targeted_values = [250, 480, 500]

      output = []

      targeted_values.each do |value|
        output << described_class.search(arr, value)
      end

      expect(output).to eq([250, 480, 500])
    end
  end
end
