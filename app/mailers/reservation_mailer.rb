class ReservationMailer < ApplicationMailer
  default from: "example@gmail.com"

  def reservation_email(schedule, email)
    subject   = "Rezervācijas apstiprinājums"
    @schedule = Schedule.find(schedule)
    @user     = @schedule.user.username
    @bike     = @schedule.bike.name
    @start_at = @schedule.start_at.strftime("%d.%m.%Y, %H:%M")
    @end_at   = @schedule.end_at.strftime("%d.%m.%Y, %H:%M")

    mail(to: email, subject: subject)
  end
end
