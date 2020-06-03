class CashRegister

    attr_accessor :discount, :total, :items, :item_prices

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
        @item_prices = []
    end

    def add_item(title, price, quantity=1)
        @total += price * quantity
        @items.fill(title, @items.size, quantity)
        @item_prices.fill(price * quantity, @item_prices.size, 1)
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            @total -= @total * @discount / 100
            return "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if @items.size > 0
            @total -= @item_prices[-1]
        else
            @total = 0
        end
    end

end