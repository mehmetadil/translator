require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "full name" do
     @profile = profiles(:one)
     assert_equal(@profile.full_name, 'Aragorn Elessar')
  end
end
