class AddFieldsForGrape < ActiveRecord::Migration
  def self.up
    add_column :grapes, :avatar_file_name, :string
    add_column :grapes, :avatar_content_type, :string
    add_column :grapes, :avatar_file_size, :integer
    add_column :grapes, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :grapes, :avatar_updated_at
    remove_column :grapes, :avatar_file_size
    remove_column :grapes, :avatar_content_type
    remove_column :grapes, :avatar_file_name
  end
end
