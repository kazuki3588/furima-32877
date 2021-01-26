class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
  end
  PRICE_HALF = /\A[0-9]+\Z/
  validates :price, presence: true, format: {with: PRICE_HALF,message: 'Half-width number'}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' } 

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
