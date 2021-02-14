class DropUpdatedAtFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :updated_at, :integer
    # rake db:create_migration NAME=drop__updated_at_from_rentals
  end
end
