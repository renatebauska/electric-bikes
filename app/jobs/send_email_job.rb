class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(schedule, email)
    ReservationMailer.reservation_email(schedule, email).deliver_now
  end
end
