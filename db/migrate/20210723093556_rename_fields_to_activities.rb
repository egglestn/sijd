class RenameFieldsToActivities < ActiveRecord::Migration[5.2]
  def change
    rename_column :records_activities, :thing_id, :activity_id
  end
end
