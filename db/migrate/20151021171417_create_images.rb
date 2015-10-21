class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.column :album_id, :integer

      t.timestamps
    end
  end
end
