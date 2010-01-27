class Grape < ActiveRecord::Base
  
  has_attached_file :avatar,
    :styles => { :large   => "98x98#", :thumb => "32x32#"},
    :url => "/attacheds/grape_:attachment/:id_partition/:id-:style.jpg" ,
    :default_url   => "/images/grape-avatar-:style-missing.png",
    :path => ":rails_root/public/attacheds/grape_:attachment/:id_partition/:id-:style.jpg"

  private
  validates_presence_of :name_cn, :name_en, :description
  
end
