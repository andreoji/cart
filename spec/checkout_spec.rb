require 'spec_helper'
describe 'Checkout' do
  before(:each) { @checkout = Checkout.new }
  
  it 'should calculate 0 when cart is empty' do
    expect(@checkout.total).to eq(0)
  end

  it 'should calculate £3.11 when cart has two green teas' do
    2.times { @checkout.scan :GR1 }
    expect(@checkout.total).to eq(3.11)
  end

  it 'should calculate £13.50 when cart has three strawberries' do
    3.times { @checkout.scan :SR1 }
    expect(@checkout.total).to eq(13.50)
  end

  it 'should calculate £22.45 when cart  GR1,SR1,GR1,GR1,CF1' do
    [:GR1,:SR1,:GR1,:GR1,:CF1].each { |item| @checkout.scan item }
    expect(@checkout.total).to eq(22.45)
  end

  it 'Basket: SR1,SR1,GR1,SR1 Total price expected: £16.61' do
    [:SR1, :SR1, :GR1, :SR1].each { |item| @checkout.scan item }
    expect(@checkout.total).to eq(16.61)
  end
end
