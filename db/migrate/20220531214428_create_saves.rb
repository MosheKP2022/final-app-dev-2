class CreateSaves < ActiveRecord::Migration[6.1]
  def change
    create_table :saves do |t|
      t.references :offering, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
