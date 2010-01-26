require 'test_helper'

class GrapeTest < ActiveSupport::TestCase
  should_validate_presence_of :name_cn, :description
  
end
