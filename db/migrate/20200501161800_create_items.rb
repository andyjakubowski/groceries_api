class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, id: :uuid do |t|
      t.string :text
      t.integer :order_id
      t.boolean :is_completed
      t.boolean :is_open

      t.timestamps
    end
  end
end
