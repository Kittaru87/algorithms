require 'reverse'

describe 'our reverse method' do

  it 'should output empty array when array is empty' do
    expect(my_reverse([1])).to eq [1]
  end

  it 'should output [2, 1] when array is [1, 2]' do
    expect(my_reverse([1, 2])).to eq [2, 1]
  end
end