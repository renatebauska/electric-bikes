class Bike < ApplicationRecord
  has_many :users, through: :schedules

  validates :name, presence: true
end
