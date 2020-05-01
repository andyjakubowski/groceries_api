class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :orderId
      t.string :text
      t.boolean :completed
      t.boolean :open

      t.timestamps
    end
  end
end
