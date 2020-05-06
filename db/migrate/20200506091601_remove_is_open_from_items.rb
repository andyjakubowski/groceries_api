class RemoveIsOpenFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :is_open, :boolean, default: false, null: false
  end
end
