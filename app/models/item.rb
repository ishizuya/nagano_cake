class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :oder_details

  validates :name, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  has_one_attached :image

  def add_tax_price
    (price * 1.1).floor
  end
end
