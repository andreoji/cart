require 'bigdecimal'
class BuyGetFreeDiscount
  def initialize(product: :GR1, price: '3.11', buy: 1, get: 1)
    @product = product
    @price = BigDecimal.new price
    @buy = buy
    @get = get
  end

  def discount(items)
    return 0 if items.empty?
    product_count = items.count :GR1
    @get * @price * (product_count / (@buy + @get))
  end
end
