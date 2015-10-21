class AddUserIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :user_id, :integer
    add_attachment :images, :picture
  end
end
