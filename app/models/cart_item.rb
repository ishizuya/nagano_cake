class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer

    # def add_tax_price
    #     (item.price * 1.1).floor.to_s(:delimited)
    # end

    def subtotal
        item.add_tax_price * amount
    end
end
