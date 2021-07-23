class RenameOthersToTreatments < ActiveRecord::Migration[5.2]
  def change
    rename_table :others, :treatments
    rename_table :others_records, :records_treatments
  end
end
