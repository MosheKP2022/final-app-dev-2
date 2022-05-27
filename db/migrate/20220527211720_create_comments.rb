class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :commenter, null: false, foreign_key: { to_table: :users }
      t.references :offering, null: false, foreign_key: true
      t.text :body, null: false
      t.boolean :private, null: false 

      t.timestamps
    end
  end
end
