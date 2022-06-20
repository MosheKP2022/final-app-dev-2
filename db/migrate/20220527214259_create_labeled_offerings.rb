class CreateLabeledOfferings < ActiveRecord::Migration[6.1]
  def change
    create_table :labeled_offerings do |t|
      t.references :offering, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
