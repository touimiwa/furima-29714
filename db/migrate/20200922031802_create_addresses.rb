class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_cord,     null: false
      t.string     :area_id,        null: false
      t.string     :municipality,   null: false
      t.string     :place,          null: false
      t.string     :building,       null: false
      t.string     :phone_number,   null: false
      t.references :order,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
