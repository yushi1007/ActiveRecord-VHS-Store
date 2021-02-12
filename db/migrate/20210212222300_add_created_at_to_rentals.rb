class AddCreatedAtToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :created_at, :integer 
  end
end
