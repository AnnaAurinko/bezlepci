class Changetype < ActiveRecord::Migration
  def change
  	rename_column :places, :type, :specification
 
  end
end
