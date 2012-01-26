class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.text :body
      t.string :name
      t.string :path
      t.string :format
      t.string :locale
      t.string :handler
      t.boolean :partial, :default => false
      t.references :folder

      t.timestamps
    end
  end

  def self.down
    drop_table :templates
  end
end
