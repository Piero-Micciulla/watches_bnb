class ChangeWatchPriceToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :watches, :price, :integer, using: 'price::integers'
  end
end
