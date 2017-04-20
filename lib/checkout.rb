require_relative 'n_or_more_discount'
require_relative 'buy_get_free_discount'
require 'bigdecimal'

class Checkout
  def initialize(discounters: [BuyGetFreeDiscount.new, NorMoreDiscount.new], products: {GR1: '3.11', SR1: '5.00', CF1: '11.23'})
    @discounters ||= discounters
    @products ||= products
    @items ||= []
  end

  def scan(item)
    @items << item
  end

  def total
    return 0 if @items.empty?
    @total = @items.inject(BigDecimal.new('0')) { |total, item| BigDecimal.new(@products[item]) + total }
    @discount = @discounters.inject(BigDecimal.new('0')) { |discount, discounter| discounter.discount(@items) + discount }
    @total - @discount
  end
end
