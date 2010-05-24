User.delete_all

admin = User.create(:login => 'admin',
                   :email => 'admin@tr3w.com',
                   :password => '1234', :password_confirmation => '1234',
                   :authorized_approver => true)
user = User.create(:login => 'obie',
                   :email => 'obie@tr3w.com',
                   :password => 'hashrocket', :password_confirmation => 'hashrocket',
                   :authorized_approver => true)

Client.delete_all
Client.create(:name => 'Aardworkers', :code => 'AARD', :created_at => 2.years.ago)
client = Client.create(:name => 'Zorganization', :code => 'ZORG')

BillingCode.delete_all
client.billing_codes.create(:code => 'MTG', :description => 'Meetings')
client.billing_codes.create(:code => 'DEV', :description => 'Development')

Timesheet.delete_all
timesheet = Timesheet.create(:user => user, :submitted => true, :created_at => 2.weeks.ago, :approver => admin)
timesheet = Timesheet.create(:user => user, :submitted => false, :created_at => Time.now)
timesheet = Timesheet.create(:user => user, :submitted => false, :created_at => 1.week.ago)

BillableWeek.delete_all
BillableWeek.create(:client => client, :billing_code => client.billing_codes.first, :timesheet => timesheet, :monday_hours => 5, :friday_hours => 1)
