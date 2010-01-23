class TimesheetsController < ApplicationController
  def create
    return unless request.post?
    @timesheet = Timesheet.new
    @timesheet.user = current_user
    if @timesheet.save
      flash[:notice] = "Timesheet created!"
      redirect_to :controller => "timesheets", :action => "show", :id => @timesheet.id
    else
      render("timesheets/new")
    end
  end

  def show
    @timesheet = Timesheet.find(params[:id])
    @clients = Client.find(:all)
  end

  def submit
    timesheet = Timesheet.find(params[:id])
    timesheet.update_attribute("submitted", true)
    flash[:notice] = "Timesheet submitted!"
    redirect_to :controller => "timesheets", :action => "show", :id => timesheet.id
  end
  
  def update
    begin
      @timesheet = Timesheet.find(params[:id])
      @timesheet.update_attributes(params[:timesheet])
      # redirect somewhere
    rescue ActiveRecord::StaleObjectError
      flash[:error] = "The timesheet was modified while you were editing it. Please retry."
      redirect_to :action => 'edit', :id => @timesheet
    end
  end
end
