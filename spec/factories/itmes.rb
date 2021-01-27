FactoryBot.define do
  factory :item do
    name {"オムライス"}
    explanation {"美味しいですよ"}
    category_id {2}
    condition_id {2}
    fee_id {2}
    price {1000}
    shipping_area_id {2}
    delivery_date_id {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
