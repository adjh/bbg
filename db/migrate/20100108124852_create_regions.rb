class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string  :name_cn
      t.string  :name_en
      t.integer :parent_id
      t.integer :depth
      t.string  :id_chain
      t.string  :cn_chain
      t.string  :en_chain
      t.string  :latitude
      t.string  :longitude
      t.text    :description
      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
