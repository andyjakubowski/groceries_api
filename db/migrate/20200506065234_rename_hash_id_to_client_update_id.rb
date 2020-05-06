class RenameHashIdToClientUpdateId < ActiveRecord::Migration[6.0]
  def change
    rename_column(:items, :hash_id, :client_update_id)
  end
end
