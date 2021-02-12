class AddUpdatedAtToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :updated_at, :integer 
  end
end
