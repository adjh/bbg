class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :forum_id
      t.integer :topic_id
      t.integer :root_id,   :default => 0
      t.integer :user_id
      t.string  :user_login
      t.string  :user_name
      t.text    :body
      t.integer :masked,    :default => 0
      t.timestamps
    end
    add_index :posts, [:forum_id, :topic_id]
    add_index :posts, :user_id
    add_index :posts, :root_id
  end

  def self.down
    drop_table :posts
  end
end
