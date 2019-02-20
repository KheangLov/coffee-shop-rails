class Branch < ApplicationRecord
  belongs_to :company
  has_many :stocks
  has_many :stock_categories
  has_many :employees

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
