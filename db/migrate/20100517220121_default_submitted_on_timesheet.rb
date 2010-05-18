class DefaultSubmittedOnTimesheet < ActiveRecord::Migration
  def self.up
    change_table :timesheets do |t|
      t.change_default :submitted, false
    end
  end

  def self.down
    change_table :timesheets do |t|
      t.change_default :submitted, nil
    end
  end
end
