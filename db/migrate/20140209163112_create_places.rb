class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :type
      t.string :address
      t.text :description
      t.integer :rating
      t.integer :comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
