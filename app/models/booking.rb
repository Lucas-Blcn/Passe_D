class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # validates :starting_date, presence: true
  # validates :ending_date, presence: true
  # validates :adress, presence: true
  #validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
