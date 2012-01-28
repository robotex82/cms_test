class CreateNavigationItems < ActiveRecord::Migration
  def self.up
    create_table :navigation_items do |t|
      t.string :key
      t.string :name
      t.string :url
      t.string :options
      t.references :navigation
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :navigation_items
  end
end
