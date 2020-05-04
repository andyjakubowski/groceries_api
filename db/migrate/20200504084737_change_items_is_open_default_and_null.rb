class ChangeItemsIsOpenDefaultAndNull < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:items, :is_open, from: nil, to: false)
    change_column_null(:items, :is_open, false, false)
  end
end
