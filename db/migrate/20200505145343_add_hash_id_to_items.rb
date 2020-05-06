class AddHashIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :hash_id, :uuid, default: -> { "gen_random_uuid()" }, null: false
  end
end
