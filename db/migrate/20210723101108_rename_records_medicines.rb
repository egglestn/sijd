class RenameRecordsMedicines < ActiveRecord::Migration[5.2]
  def change
    rename_table :medicines_records, :records_medicines
  end
end
