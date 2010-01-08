class CreateGrapes < ActiveRecord::Migration
  def self.up
    create_table :grapes do |t|
      t.string  :name_cn
      t.string  :name_en
      t.text    :description
      t.string  :alias_cn
      t.string  :smell
      t.timestamps
    end
    add_index :grapes,  :name_cn
    add_index :grapes,  :name_en
  end

  def self.down
    drop_table :grapes
  end
end
