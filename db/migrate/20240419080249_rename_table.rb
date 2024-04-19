class RenameTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :chat_users, :chats_users
  end
end
