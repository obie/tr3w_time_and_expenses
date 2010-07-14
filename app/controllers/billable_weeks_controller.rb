class BillableWeeksController < ApplicationController
  def add_to_timesheet
    @billable_week = BillableWeek.new(params[:billable_week])

    if params[:date].blank?
      flash[:error] = "Date required"
      redirect_to :back
    end

    y, m, d = params[:date].values_at(:year, :month, :day).map(&:to_i)
    @billable_week.start_date = Date.new(y,m,d)

    @timesheet = Timesheet.find(params[:timesheet_id])
    @billable_week.timesheet = @timesheet

    if @billable_week.save
      flash[:notice] = "Billable week added to timesheet!"
      redirect_to timesheet_url(@timesheet)
    else
      render("timesheet/show/#{@timesheet.id}")
    end
  end
end
