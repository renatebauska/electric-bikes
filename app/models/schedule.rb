class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :user_id, :bike_id, :start_at, :end_at, presence: true

  class_attribute :contact_email

  scope :order_by_date, -> { order(end_at: :desc) }
end
