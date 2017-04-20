require 'bigdecimal'
class NorMoreDiscount
  def initialize(product: :SR1, discount: '0.50', n_or_more: 3)
    @product = product
    @discount = discount
    @n_or_more = n_or_more
  end

  def discount(items)
    return 0 if items.empty?
    product_count = items.count @product
    return (BigDecimal.new(@discount) * product_count) if product_count >= @n_or_more
    0
  end
end
