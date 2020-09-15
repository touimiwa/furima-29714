class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  belongs_to :user

  with_options presence: true do
    validates :name, message: "Name can't be blank"
    validates :description, message: "Info can't be blank"
    validates :category_id, message: "Category Select"
    validates :condition_id, message: "Sales status Select"
    validates :charges_id, message: "Shipping fee status Select"
    validates :area_id, message: "Prefecture Select"
    validates :days_id, message: "Scheduled delivery Select"
    # validates :price, format: { with: /^[0-9]+$/} message: "Price Half-width number" do
    # end
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: "Price Out of setting range"

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
end

