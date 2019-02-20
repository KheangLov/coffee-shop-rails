class User < ApplicationRecord
  belongs_to :role
  has_many :companies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # before_validation :set_default_role, on: :create

  enum status: { pending: APP::PENDING, active: APP::ACTIVE, inactive: APP::INACTIVE, banned: APP::BANNED }
  enum gender: { male: APP::MALE, female: APP::FEMALE, other: APP::OTHER }
  before_save :concatenate_name

  def concatenate_name
    self.name = "#{firstname}#{lastname}"
  end

  private

  # def set_default_role
  #   self.role = Role.find_by_name(APP::ROLE_USER)
  # end
end
