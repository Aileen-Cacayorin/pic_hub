class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.column :image_id, :integer
      t.column :user_id, :integer

      t.timestamps null: false
    end
  end
end
