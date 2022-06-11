class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum select_address: { my_address: 0, registered_address: 1, new_address: 2 }
  enum status: { waiting_deposit: 0, payment_confirmation: 1, in_production: 2, preparing_ship: 3, sent: 4 }
  
  def select_address
  end
  
end
