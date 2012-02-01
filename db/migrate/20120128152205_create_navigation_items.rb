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
    NavigationItem.create_translation_table! :name => :string, :url => :string
  end

  def self.down
    NavigationItem.drop_translation_table!
    drop_table :navigation_items
  end
end
