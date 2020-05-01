class RenameCompletedToIsCompletedInItems < ActiveRecord::Migration[6.0]
  def change
    rename_column(:items, :completed, :is_completed)
  end
end
