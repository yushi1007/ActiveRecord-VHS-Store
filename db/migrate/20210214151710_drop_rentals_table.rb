class DropRentalsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :rentals
    # rake db:create_migration NAME=drop_rentals_table
  end
end
