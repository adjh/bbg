class Winery < ActiveRecord::Base
  
  has_attached_file :avatar,
    :styles => { :large   => "98x98#"},
    :url => "/attacheds/winery/:attachment/:id_partition/:id-:style.png" ,
    :default_url   => "/images/winery-avatar-:style-missing.png",
    :path => ":rails_root/public/attacheds/winery/:attachment/:id_partition/:id-:style.png"
    
end
