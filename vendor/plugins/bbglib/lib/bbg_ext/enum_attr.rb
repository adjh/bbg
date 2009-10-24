# BBGlib
# create by Raecoo

# Example:

# Model
# class User < ActiveRecord::Base   
#   enum_attr :sex, [['男', 0], ['女', 1]]  
# end

# View
# form.select :sex, User::ENUMS_SEX

module EnumAttr

  module Mixin
    def enum_attr(attr, enums)
      attr = attr.to_s
      self.class_eval(%Q{
        ENUMS_#{attr.upcase} = enums
        validates_inclusion_of attr, :in => enums.map{|e| e[1]}, :allow_nil => true
        def #{attr}_name
          ENUMS_#{attr.upcase}.find{|option| option[1] == #{attr}}[0] unless #{attr}.nil?
        end
        })
    end
  end
    
end


