class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order

    enum making_status: { not_production: 0, waiting_production: 1, in_production: 2, production_completion: 3 }

    def subtotal
        price * amount
    end
end
