class CreateVinyls < ActiveRecord::Migration[7.1]
  def change
    create_table :vinyls do |t|
      t.string :name
      t.integer :time
      t.integer :price
      t.integer :year
      t.string :condition
      t.references :genre, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
