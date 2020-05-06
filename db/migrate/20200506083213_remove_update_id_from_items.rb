class RemoveUpdateIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :update_id, :uuid, default: -> { "gen_random_uuid()" }, null: false
  end
end
