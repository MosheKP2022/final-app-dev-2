class AddContactUsMessagesCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :contact_us_messages_count, :integer, default: 0
  end
end
