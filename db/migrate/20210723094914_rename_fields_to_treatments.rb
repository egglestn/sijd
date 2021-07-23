class RenameFieldsToTreatments < ActiveRecord::Migration[5.2]
  def change
    rename_column :records_treatments, :other_id, :treatment_id
  end
end
