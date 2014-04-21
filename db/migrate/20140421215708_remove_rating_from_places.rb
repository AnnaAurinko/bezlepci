class RemoveRatingFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :rating, :integer
  end
end
