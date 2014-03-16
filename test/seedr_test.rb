require 'test_helper'

class SeedrTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Seedr
  end
  
  def test_random_string_is_string
    assert_kind_of String, Seedr.random_string(8)
  end
end
