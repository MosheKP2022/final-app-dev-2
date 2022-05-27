class CreateFamilyMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :family_members do |t|
      t.references :parent_id, null: false, foreign_key: { to_table: :users }
      t.references :kid_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
