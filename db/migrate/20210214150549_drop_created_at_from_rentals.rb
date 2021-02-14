class DropCreatedAtFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :created_at, :integer
  end
end
