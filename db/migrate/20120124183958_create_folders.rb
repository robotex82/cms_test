class CreateFolders < ActiveRecord::Migration
  def self.up
    create_table :folders do |t|
      t.string :basename
      t.string :path
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :templates_count, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :folders
  end
end
