class Wine < ActiveRecord::Base
  
  has_attached_file :avatar,
    :styles => { :large   => "98x98#"},
    :url => "/attacheds/wine/:attachment/:id_partition/:id-:style.png" ,
    :default_url   => "/images/wine-avatar-:style-missing.png",
    :path => ":rails_root/public/attacheds/wine/:attachment/:id_partition/:id-:style.png"
    
end
