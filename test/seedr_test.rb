require 'test_helper'

class SeedrTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Seedr
  end
  
  def test_random_string_is_string
    assert_kind_of String, Seedr.random_string(8)
  end
  
  def test_seeded_types
    s = Seeded.seed
    assert_kind_of String, s.string_field, "string_field expected class==String.  Got #{s.string_field.class}"
    assert_kind_of String, s.text_field, "text_field expected class==String.  Got #{s.text_field.class}"
    assert_kind_of Fixnum, s.integer_field, "integer_field expected class==Fixnum.  Got #{s.integer_field.class}"
    assert_kind_of Float, s.float_field, "float_field expected class==Float.  Got #{s.float_field.class}"
    assert_kind_of BigDecimal, s.decimal_field, "decimal_field expected class==BigDecimal.  Got #{s.decimal_field.class}"
    assert_kind_of ActiveSupport::TimeWithZone, s.datetime_field, "datetime_field expected class==ActiveSupport::TimeWithZone.  Got #{s.datetime_field.class}"
    assert_kind_of ActiveSupport::TimeWithZone, s.timestamp_field, "timestamp_field expected class==ActiveSupport::TimeWithZone.  Got #{s.timestamp_field.class}"
    assert_kind_of Time, s.time_field, "time_field expected class==Time.  Got #{s.time_field.class}"
    assert_kind_of Date, s.date_field, "date_field expected class==Date.  Got #{s.date_field.class}"
    assert_kind_of TrueClass || FalseClass, s.boolean_field, "boolean_field expected class==TrueClass || FalseClass.  Got #{s.boolean_field.class}"
  end
end
