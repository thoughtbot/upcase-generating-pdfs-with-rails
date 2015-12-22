class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :account
      t.string :number
      t.date :date
      t.text :notes

      t.timestamps null: false
    end
  end
end
