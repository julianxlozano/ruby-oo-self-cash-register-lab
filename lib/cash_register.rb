require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total, :title , :prices 


    def initialize(discount=0)
        @discount = discount 
        @total = 0
        @title=[]
        @prices=[]
    end

    def add_item(item,price,qty=1)
        @prices << price 
        qty.times {@title << item}
        @total += price * qty 
    end

    def apply_discount
        if @discount>0
        new_discount=@discount.to_s.prepend(".").to_f
        actual_discount= @total * new_discount 
        @total -= actual_discount
        "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
     self.title 
    end

    def void_last_transaction
       @title.pop
       @total -= @prices.pop 


        if @prices.empty? 
            @total= 0.0
        end

        
    end
end
