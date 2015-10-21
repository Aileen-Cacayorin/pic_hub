class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :user_id, :integer
      t.column :body, :string
      t.column :image_id, :integer

      t.timestamps
    end
  end
end
