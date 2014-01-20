class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :url
      t.string :name
      t.integer :user_id
      t.integer :timeout, :default => 60
      t.boolean :change, :default => false
      t.datetime :datelastmodified

      t.timestamps
    end
  end
end
