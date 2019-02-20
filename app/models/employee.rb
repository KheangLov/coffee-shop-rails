class Employee < ApplicationRecord
  belongs_to :branch
  belongs_to :company
  validates :email, allow_blank: true, length: { maximum: 255 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :valid_phones

  def valid_phones
    validate_phones_by_comma(phones)
  end
end
