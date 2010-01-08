class CreateContentCategories < ActiveRecord::Migration
  def self.up
    create_table :content_categories do |t|
      t.string  :name,  :null => false
      t.integer :parent_id
      t.integer :position
      t.timestamps
    end
    add_index :content_categories,  :parent_id
    add_index :content_categories,  :position
  end

  def self.down
    drop_table :content_categories
  end
end
