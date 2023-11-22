require 'test/unit'
require_relative '../models/discount'

class TestDiscount < Test::Unit::TestCase
  def test_evening_discount
    evening_time = Time.new(2023, 4, 10, 18, 0) # Evening time
    assert_equal(100, Discount.evening_discount(evening_time), "Evening discount should be 100 yen")
  end

  def test_no_evening_discount
    non_evening_time = Time.new(2023, 4, 10, 16, 30) # Non-evening time
    assert_equal(0, Discount.evening_discount(non_evening_time), "No evening discount should apply before 5 PM")
  end

  def test_holiday_surcharge
    assert_equal(-200, Discount.holiday_surcharge(true), "Holiday surcharge should be -200 yen")
  end

  def test_no_holiday_surcharge
    assert_equal(0, Discount.holiday_surcharge(false), "No holiday surcharge should apply on non-holidays")
  end

  def test_weekday_discount
    assert_equal(100, Discount.weekday_discount("monday"), "Weekday discount should be 100 yen on Monday")
    assert_equal(100, Discount.weekday_discount("wednesday"), "Weekday discount should be 100 yen on Wednesday")
  end

  def test_no_weekday_discount
    assert_equal(0, Discount.weekday_discount("friday"), "No weekday discount should apply on Friday")
  end

  def test_group_discount
    base_total = 1000 # Example base price
    assert_equal(100, Discount.group_discount(base_total, 10), "Group discount for 10 adults should be 100 yen each")
  end

  def test_no_group_discount
    base_total = 1000 # Example base price
    assert_equal(0, Discount.group_discount(base_total, 5), "No group discount should apply for less than 10 people")
  end

end

