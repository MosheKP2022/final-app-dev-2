class CreateOfferings < ActiveRecord::Migration[6.1]
  def change
    enable_extension("citext")
    create_table :offerings do |t|
      t.citext :title
      t.text :description
      t.string :image
      t.float :min_age
      t.float :max_age
      t.citext :address
      t.float :price
      t.date :date
      t.time :time
      t.string :video
      t.citext :status
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.integer :comments_count, default: 0
      t.integer :labeled_offerings_count, default: 0
      t.integer :saves_count, default: 0

      t.timestamps
    end
  end
end
