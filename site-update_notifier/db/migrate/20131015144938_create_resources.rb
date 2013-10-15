class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.string :name
      t.integer :user_id
      t.integer :timeout
      t.boolean :change

      t.timestamps
    end
  end
end
