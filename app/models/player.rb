class Player < ApplicationRecord
  validates :name, :age, :prize_money, :grand_slams, presence: true

  has_many :titles, dependent: :destroy
end
