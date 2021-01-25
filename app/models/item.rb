class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end
  PRICE_REGEX = /\A(?=.*?[300-9,999,999]\d)[300-9.999,999\d]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'Out of setting range'
  validates_format_of :price, with: PRICE_REGEX, message: 'Half-width number'
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_date
  belongs_to :shipping_area
  belongs_to :fee
  belongs_to :condition
  belongs_to :category
  with_options presence: {message: 'Select'} do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :shipping_area_id
    validates :delivery_date_id
  end
end
