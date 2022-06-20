class CreateTags < ActiveRecord::Migration[6.1]
  def change
    enable_extension("citext")
    create_table :tags do |t|
      t.citext :name
      t.integer :labeled_offerings_count

      t.timestamps
    end
  end
end
