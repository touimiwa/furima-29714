class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_cord, :area_id, :municipality, :place, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :municipality
    validates :place
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_cord, 
    end
  end
  
  validates :area_id, numericality: { other_than: 0 } do
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cord: postal_cord, area_id: area_id, municipality: municipality, place: place, building: building, phone_number: phone_number, order_id: order.id)
  end
end
