require 'spec_helper'
describe 'NorMoreDiscount' do
  before(:each) { @discounter = NorMoreDiscount.new }
  it 'should calculate 0 discount when empty' do
    expect(@discounter.discount([])).to eq(0)
  end

  it 'should calculate £1.50 for 3 strawberies' do
    expect(@discounter.discount([:SR1, :SR1, :SR1])).to eq(1.50)
  end
  
  it 'should calculate £2 for 4 strawberies' do
    expect(@discounter.discount([:SR1, :SR1, :SR1, :SR1])).to eq(2.00)
  end

  it 'should calculate 0 for 1 coffee' do
    expect(@discounter.discount([:CF1])).to eq(0.00)
  end
end
