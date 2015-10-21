class AddUsernameAndAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_attachment :users, :avatar
  end
end
