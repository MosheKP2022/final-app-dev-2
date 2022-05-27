class CreateContactUsMessages < ActiveRecord::Migration[6.1]
  def change
    enable_extension("citext")
    create_table :contact_us_messages do |t|
      t.citext :title
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
