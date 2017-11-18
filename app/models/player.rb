class Player < ApplicationRecord
  validates :name, :age, :prize_money, :titles, :grand_slams, presence: true
end
