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

#solution
# class CashRegister

#   attr_accessor :items, :discount, :total, :last_transaction

#   def initialize(discount=0)
#     @total = 0
#     @discount = discount
#     @items = []
#   end

#   def add_item(title, amount, quantity=1)
#     self.total += amount * quantity
#     quantity.times do
#       items << title
#     end
#     self.last_transaction = amount * quantity
#   end

#   def apply_discount
#     if discount != 0
#       self.total = (total * ((100.0 - discount.to_f)/100)).to_i
#       "After the discount, the total comes to $#{self.total}."
#     else
#       "There is no discount to apply."
#     end
#   end

#   def void_last_transaction
#     self.total = self.total - self.last_transaction
#   end
# end

