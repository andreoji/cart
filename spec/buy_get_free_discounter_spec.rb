require 'spec_helper'
describe 'BuyGetFreeDiscount' do
  before(:each) { @discounter = BuyGetFreeDiscount.new }
  
  it 'should calculate 0 discount when empty' do
    expect(@discounter.discount([])).to eq(0)
  end

  it 'should calculate 0 discount for a single green tea' do
    expect(@discounter.discount([:GR1])).to eq(0)
  end

  it 'should calculate £3.11 discount for two green tea' do
    expect(@discounter.discount([:GR1, :GR1])).to eq(3.11)
  end
  
  it 'should calculate £6.22 discount for four green tea' do
    expect(@discounter.discount([:GR1, :GR1, :GR1, :GR1])).to eq(6.22)
  end

  it 'should calculate £9.66 discount for six green tea' do
    items = [:SR1, :SR1]
    6.times { items << :GR1 }
    expect(@discounter.discount(items)).to eq(9.33)
  end
end
