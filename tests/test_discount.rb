require 'test/unit'
require_relative '../models/discount'

class TestDiscount < Test::Unit::TestCase
  def test_evening_discount
    evening_time = Time.new(2023, 4, 10, 18, 0) # Evening time
    assert_equal(100, Discount.evening_discount(evening_time), "夕方割引は100円となる。")
  end

  def test_no_evening_discount
    non_evening_time = Time.new(2023, 4, 10, 16, 30) # Non-evening time
    assert_equal(0, Discount.evening_discount(non_evening_time), "午後5時前には夕方割引は適用されない。")
  end

  def test_holiday_surcharge
    assert_equal(-200, Discount.holiday_surcharge(true), "休日の割引は-200円となる（追加料金として適用）。")
  end

  def test_no_holiday_surcharge
    assert_equal(0, Discount.holiday_surcharge(false), "休日でない場合は休日の追加料金は適用されない。")
  end

  def test_monday_discount
    assert_equal(100, Discount.weekday_discount("monday"), "月曜日割引は月曜日に100円です。")
  end

  def test_wednesday_discount
    assert_equal(100, Discount.weekday_discount("wednesday"), "水曜日割引は水曜日に100円となる")
  end

  def test_no_weekday_discount
    assert_equal(0, Discount.weekday_discount("friday"), "金曜日には平日割引は適用されない。")
  end

  def test_group_discount
    base_total = 1000 # Example base price
    assert_equal(100, Discount.group_discount(base_total, 10), "10名の大人の団体割引は一人当たり100円となる。")
  end

  def test_no_group_discount
    base_total = 1000 # Example base price
    assert_equal(0, Discount.group_discount(base_total, 5), "10人未満の場合は団体割引は適用されない。")
  end

end

