class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.string :name
      t.integer :user_id
      t.integer :timeout
      t.timestamps :timestamps

      t.timestamps
    end
    add_index :resources, [:user_id, :created_at]
  end
end
