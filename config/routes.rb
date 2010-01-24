TimeAndExpenses::Application.routes.draw do |map|

  map.home '', :controller => 'general'

# Stuff for chapter on named routes (not restful):

# timesheets
#
# This route makes it so that we can call timesheet_url and
# get a show.
  map.timesheet 'timesheet/show/:id',
    :controller => "timesheets",
    :action     => "show"

# This route submits a new week for the timesheet.
  map.add_week 'add_week/:timesheet_id',
    :controller => "billable_weeks",
    :action     => "add_to_timesheet"

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
  
  map.resources :billing_codes
  map.resources :clients
end
