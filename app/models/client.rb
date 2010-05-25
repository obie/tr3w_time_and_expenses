class Client < ActiveRecord::Base
  has_many :billing_codes
  has_many :billable_weeks
  has_many :timesheets, :through => :billable_weeks, :uniq => true
  has_many :contact_cards
  has_many :people_contacts, :through => :contact_cards, 
           :source => :contact
  has_many :business_contacts, :through => :contact_cards, 
           :source => :contact
  has_many :users, :dependent => :destroy

  scope :recent, where("created_at > ?", 1.year.ago).order("created_at desc")

  validates_presence_of :name

  def draft_timesheets
    timesheets.draft.to_a # TODO: remove .to_a when Rails to_json bug fixed
  end

end
