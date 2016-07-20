require 'pry'
class CashRegister

  attr_accessor :total

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @item_array = []
  end

  def discount
    @discount
  end

  def add_item(item, price, quantity = nil)

    if quantity == nil
      @total += price
      @item_array << item
    else
      @total += (price * quantity)
      quantity.times do
        @item_array << item
      end
    end
  end

  def apply_discount
    if self.discount != nil
      @total -= (self.discount * @total/100)
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_array
  end

  def void_last_transaction
    @total -= self.total
  end
end
