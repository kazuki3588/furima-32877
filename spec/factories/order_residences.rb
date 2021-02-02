FactoryBot.define do
  factory :order_residence do
    postal_code {'123-1234'}
    shipping_area_id {3}
    municipality {'薩摩川内市'}
    address {'1-1'}
    building_name {'緑'}
    phone_number {12345678910}
    token {"tok_dc3d6973c07a33958ade206b95aa"}
  end
end
