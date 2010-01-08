class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines do |t|
      t.integer :region_id
      t.integer :wine_type_id
      t.integer :winery_id
      t.string  :name_cn
      t.string  :name_en
      t.text    :description
      t.integer :vintage
      t.integer :capacity
      t.float   :degree
      t.string  :drink_at
      t.integer :onsale,    :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :wines
  end
end
