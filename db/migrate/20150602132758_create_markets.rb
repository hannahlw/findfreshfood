class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.string :address
      t.string :product
      t.string :schedule
      t.string :google_link

      t.timestamps null: false
    end
  end
end
