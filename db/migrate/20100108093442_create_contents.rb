class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.integer :editor_id,     :null => false
      t.string  :editor_login,  :null => false
      t.string  :editor_name,   :null => false
      t.integer :category_id,   :null => false
      t.string  :title,         :null => false
      t.text    :body
      t.integer :audit,       :default => 0
      t.integer :recommend,   :default => 0
      t.integer :commentable, :default => 1
      t.string  :reference
      t.string  :keywords  
      t.timestamps
    end
    add_index :contents,  :editor_id
    add_index :contents,  :category_id
    add_index :contents,  :audit
    add_index :contents,  :recommend
  end

  def self.down
    drop_table :contents
  end
end
