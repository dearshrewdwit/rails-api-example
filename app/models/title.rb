class Title < ApplicationRecord
  validates :name, :title_type, :year, presence: true

  belongs_to :player
end
