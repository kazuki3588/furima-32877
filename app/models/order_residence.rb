class  OrderResidence
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id, :token
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :municipality
    validates :address
    validates :token
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :item_id
    validates :user_id
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "cna't be blank"}
  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Residence.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end