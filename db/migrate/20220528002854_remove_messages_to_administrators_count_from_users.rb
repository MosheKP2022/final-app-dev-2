class RemoveMessagesToAdministratorsCountFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :messages_to_administrators_count
  end
end
