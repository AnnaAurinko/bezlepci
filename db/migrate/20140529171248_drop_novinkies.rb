class DropNovinkies < ActiveRecord::Migration
  def change
    drop_table :novinkies
  end
end
