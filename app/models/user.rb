class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings, dependent: :destroy
  has_many :products, through: :bookings, dependent: :destroy
  has_many :products
  # validates :pseudo, presence: true
  # validates :phone_number, format: { with: /\A(\+33\s?|0)[67]\s?\d{2}(\s?\d{2}){3}\z/, message: "Le format du numéro de téléphone français n'est pas valide" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
