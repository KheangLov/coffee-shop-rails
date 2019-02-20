class StockCategory < ApplicationRecord
  belongs_to :branch
  has_many :stocks

  validates :name, presence: true, uniqueness: { scope: :branch_id, case_sensitive: false }, length: { maximum: 255 }
end
