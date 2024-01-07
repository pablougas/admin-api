class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :administrative_area_level_1
      t.string :administrative_area_level_2
      t.string :country
      t.decimal :latitude, :precision=>10, :scale=>6
      t.string :locality
      t.decimal :longitude, :precision=>10, :scale=>6
      t.string :postal_code
      t.string :route
      t.string :street_number

      t.timestamps
    end
  end
end
