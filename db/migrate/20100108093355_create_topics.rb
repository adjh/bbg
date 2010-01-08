class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.integer :forum_id,      :null => false
      t.integer :user_id,       :null => false
      t.string  :user_login,    :null => false
      t.string  :user_name,     :null => false
      t.string  :title,         :null => false
      t.integer :sticky,  :default => 0
      t.integer :locked,  :default => 0
      t.integer :posts_count,   :default => 0
      t.integer :last_user_id
      t.string  :last_user_login
      t.string  :last_user_name
      t.date    :last_updated_at
      t.timestamps
    end
    add_index :topics, :forum_id
    add_index :topics, :user_id
    add_index :topics, :title
    add_index :topics, :last_updated_at
  end

  def self.down
    drop_table :topics
  end
end
