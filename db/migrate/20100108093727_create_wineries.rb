class CreateWineries < ActiveRecord::Migration
  def self.up
    create_table :wineries do |t|
      t.integer :region_id
      t.integer :depth
      t.string  :name_cn
      t.string  :name_en
      t.text    :description
      t.float   :latitude
      t.float   :longitude
      t.timestamps
    end
  end

  def self.down
    drop_table :wineries
  end
end
