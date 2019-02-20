class Company < ApplicationRecord
  belongs_to :user
  has_many :employees
  has_many :branches
  enum status: { pending: APP::PENDING, active: APP::ACTIVE, inactive: APP::INACTIVE, banned: APP::BANNED }
  validates :email, allow_blank: true, length: { maximum: 255 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
