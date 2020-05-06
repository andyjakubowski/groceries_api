class RenameClientUpdateIdToUpdateId < ActiveRecord::Migration[6.0]
  def change
    rename_column(:items, :client_update_id, :update_id)
  end
end
