class CreateTables < ActiveRecord::Migration[5.0]

  def change

    create_table :start_locations do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.boolean :favorite
      t.timestamps
    end

    create_table :end_locations do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.boolean :favorite
      t.timestamps
    end

    create_table :rides do |t|
      t.string :name
      t.string :product_type
      t.integer :start_location_id
      t.integer :end_location_id
      t.boolean :favorite
      t.integer :duration
      t.integer :distance
      t.float :low_estimate
      t.float :high_estimate
      t.float :avg_estimate
      t.string :estimate
      t.timestamps
    end
    
  end

end
