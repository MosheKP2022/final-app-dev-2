class CreateOfferings < ActiveRecord::Migration[6.1]
  def change
    create_table :offerings do |t|
      t.string :title
      t.text :description
      t.string :image
      t.float :min_age
      t.float :max_age
      t.string :address
      t.float :price
      t.date :date
      t.time :time
      t.string :video
      t.string :status
      t.references :seller, null: false, foreign_key: true
      t.integer :comments_count
      t.integer :labeled_offerings_count
      t.integer :saves_count

      t.timestamps
    end
  end
end
