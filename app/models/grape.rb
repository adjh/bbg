class Grape < ActiveRecord::Base
  
  has_attached_file :avatar,
    :styles => { :large   => "98x98#"},
    :url => "/attacheds/grape/:attachment/:id_partition/:id-:style.png" ,
    :default_url   => "/images/grape-avatar-:style-missing.png",
    :path => ":rails_root/public/attacheds/grape/:attachment/:id_partition/:id-:style.png"
    
end
