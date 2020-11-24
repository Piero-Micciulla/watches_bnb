class AddDescriptionColumnToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :description, :text
  end
end
