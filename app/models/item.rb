class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :category 
   belongs_to_active_hash :condition
   belongs_to_active_hash :charge
   belongs_to_active_hash :area
   belongs_to_active_hash :days


   belongs_to :user

   with_options presence: true do
    validates :name
    validates :description  
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :area_id
    validates :days_id 
   end

  validates_inclusion_of :price, in: 300..9_999_999 

  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 }
  validates :charge_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 0 }
  validates :days_id, numericality: { other_than: 1 }
end

