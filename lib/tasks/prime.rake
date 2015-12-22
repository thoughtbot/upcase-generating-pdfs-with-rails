require "factory_girl_rails"

desc "Prime the DB with sample data"
task prime: :environment do
  include FactoryGirl::Syntax::Methods

  LineItem.destroy_all
  Product.destroy_all
  Invoice.destroy_all

  tool = create :product, price: 29.95, item_number: "tool-123-ab4",
    description: "A mutli-purpose tool"
  level = create :product, price: 49.50, item_number: "tool-389-b5d",
    description: "Thermonuclear level w/ kick stand"
  tacks = create :product, price: 9.15, item_number: "tool-887-bd4",
    description: "Thumb tacks... really good ones"
  saw = create :product, price: 25.00, item_number: "tool-387-saw",
    description: "A very sharp saw"
  nails = create :product, price: 1.57, item_number: "tool-845-bb2",
    description: "A collection of nails, about the same size"

  invoice = create :invoice
  create :line_item, invoice: invoice, product: tacks
  create :line_item, invoice: invoice, product: tool
  create :line_item, invoice: invoice, product: level

  other_invoice = create :invoice
  create :line_item, invoice: other_invoice, product: tacks
  create :line_item, invoice: other_invoice, product: level
  create :line_item, invoice: other_invoice, product: nails
  create :line_item, invoice: other_invoice, product: tool
  create :line_item, invoice: other_invoice, product: saw, quantity: 5

  last_invoice = create :invoice
  create :line_item, invoice: last_invoice, product: level
  create :line_item, invoice: last_invoice, product: tacks
  create :line_item, invoice: last_invoice, product: nails
  create :line_item, invoice: last_invoice, product: saw
end
