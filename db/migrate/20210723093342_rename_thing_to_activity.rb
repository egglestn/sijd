class RenameThingToActivity < ActiveRecord::Migration[5.2]
  def change
    rename_table :things, :activities
    rename_table :records_things, :records_activities
  end
end
