class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # validates :starting_date, presence: true
  # validates :ending_date, presence: true
  # validates :adress, presence: true
end
