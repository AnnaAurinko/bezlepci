class CreateNovinkies < ActiveRecord::Migration
  def change
    create_table :novinkies do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
