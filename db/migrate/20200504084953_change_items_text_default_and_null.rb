class ChangeItemsTextDefaultAndNull < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:items, :text, from: nil, to: '')
    change_column_null(:items, :text, false, '')
  end
end
