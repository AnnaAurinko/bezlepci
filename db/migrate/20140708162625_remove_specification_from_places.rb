class RemoveSpecificationFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :specification, :string
  end
end
