class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country_id
      t.string :region_id
      t.string :city_id
      t.string :settlement_id
      t.string :district_id
      t.string :street_id
      t.string :house
      t.string :flat

      t.timestamps
    end
  end
end
