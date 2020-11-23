class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.string :brand
      t.string :price
      t.date :start_date
      t.date :end_date
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
