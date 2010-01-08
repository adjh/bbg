class CreateWineTypes < ActiveRecord::Migration
  def self.up
    create_table :wine_types do |t|
      t.string  :name_cn
      t.string  :name_en
      t.string  :parent_id
      t.string  :id_chain
      t.string  :cn_chain
      t.string  :en_chain
      t.timestamps
    end
  end

  def self.down
    drop_table :wine_types
  end
end
