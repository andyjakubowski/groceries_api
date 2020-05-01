class RenameOpenToIsOpenInItems < ActiveRecord::Migration[6.0]
  def change
    rename_column(:items, :open, :is_open)
  end
end
