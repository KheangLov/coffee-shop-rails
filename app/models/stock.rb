class Stock < ApplicationRecord
  belongs_to :stock_category
  belongs_to :branch

  enum status: { pending: APP::PENDING, active: APP::ACTIVE, inactive: APP::INACTIVE, deleted: APP::DELETED, banned: APP::BANNED }
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :sale_price, presence: true, numericality: { greater_than_or_equal_to: :price }

  before_save :check_alerted_quantity

  def check_alerted_quantity
    self.alerted = (self.qty <= self.alert_qty) ? true : false
  end
end
