class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :destroy, :cancel]

  def index
    @schedules = Schedule.order_by_date

    authorize @schedules

    respond_to do |format|
      format.html
      format.pdf do
        render pdf:
          "schedule",
          layout: "pdf.html"
      end
    end
  end

  def show
  end

  def new
    @schedule = Schedule.new

    authorize @schedule

    @bike = Bike.find params[:bike]
    @user = current_user
  end

  def create
    @schedule = Schedule.new(schedule_params)

    authorize @schedule

    if @schedule.save

      # Set bike as unavailable, so users won't be able to reserve it
      @schedule.bike.update(available: false)

      # If user has email, message will be sent to the email day before the reservation starts
      unless schedule_params[:contact_email].blank?
        SendEmailJob
          .set(wait_until: @schedule.start_at - 1.day)
          .perform_later(@schedule.id, schedule_params[:contact_email])
      end
    end

    redirect_to schedules_path
  end

  def destroy
    @schedule.destroy

    redirect_to schedules_path
  end

  # Cancels bike reservation
  def cancel
    @schedule.update(canceled: true)

    redirect_to schedules_path
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule)
      .permit(:user_id, :bike_id, :start_at, :end_at, :contact_email)
  end
end
