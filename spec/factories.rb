FactoryGirl.define do
  factory :invoice do
    account { "#{Random.rand(10..99)}-#{Random.rand(10000..99999)}" }
    number { "#{Random.rand(1..9)}-#{Random.rand(10..99)}-#{Random.rand(10000..99999)}" }
    date { Random.rand(1..25).days.ago }
    notes "Make sure to deliver between 3:15 and 3:28, otherwise Mike is likely to be on break."
  end

  factory :product do
    description "A multi-purpose tool"
    item_number "tool-124-ab2"
    price 29.95
  end

  factory :line_item do
    invoice
    quantity { Random.rand(1..9) }
    product
  end
end
