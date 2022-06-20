class AddParentsCountToKids < ActiveRecord::Migration[6.1]
  def change
    add_column :kids, :parents_count, :integer, default: 0
  end
end
