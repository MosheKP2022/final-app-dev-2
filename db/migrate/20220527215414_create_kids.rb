class CreateKids < ActiveRecord::Migration[6.1]
  def change
    enable_extension("citext")
    create_table :kids do |t|
      t.citext :first_name
      t.citext :last_name
      t.date :dob
      t.text :about_me
      t.citext :school
      t.integer :family_members_count, default: 0

      t.timestamps
    end
  end
end
