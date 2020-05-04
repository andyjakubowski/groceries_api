class ChangeItemsIsCompletedNullToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:items, :is_completed, false, false)
  end
end
