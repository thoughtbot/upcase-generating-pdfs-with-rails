class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :invoice, index: true, foreign_key: true
      t.integer :quantity
      t.references :product

      t.timestamps null: false
    end
  end
end
