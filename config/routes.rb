TimeAndExpenses::Application.routes.draw do |map|

  root :to => 'general#index'

  resources :clients do
    collection do
      get :recent
      get :newest
      get :counts
    end

    resources :billing_codes
  end

  # Stuff for chapter on named routes (not restful):

  # timesheets
  #
  # This route makes it so that we can call timesheet_url and
  # get a show.
  match 'timesheet/show/:id' => 'timesheets#show', :as => :timesheet

  # This route submits a new week for the timesheet.
  match 'add_week/:timesheet_id' => 'billable_weeks#add_to_timesheet', :as => :add_week

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
