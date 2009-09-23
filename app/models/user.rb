class User < ActiveRecord::Base

  has_attached_file :avatar,
    :styles => { :large   => "98x98#", :medium => "48x48#", :thumb => "32x32#"},
    :url => "/:attachment/:id_partition/:id-:style.png" ,
    :default_url   => "/images/avatar-:style-missing.png",
    :path => ":rails_root/public/:attachment/:id_partition/:id-:style.png"
  
  validates_attachment_content_type :avatar, 
    :content_type => ['image/jpeg','image/gif','image/jpg','image/x-png']  

  acts_as_authentic do |c|
    validates_length_of_login_field_options({:within => 4..20})
    validates_format_of_login_field_options({:with => /^[-a-z0-9_\-]+$/i, 
      :message => I18n.t('error_messages.login_invalid', 
        :default => "should use only a~z, A-Z, '-', 0-9, '_' please.")})
  end
  
  
  validates_presence_of :name
  validates_length_of   :name, :within => 3..20
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    # Notifier.deliver_password_reset_instructions(self)  
  end  
  
end
