require 'test/unit'
require_relative '../models/calculator'
require_relative '../models/ticket'
require_relative '../models/discount'

class TestCalculator < Test::Unit::TestCase
  def setup
    @time_non_evening = Time.new(2023, 11, 21, 16, 30) # Non-evening time
    @time_evening = Time.new(2023, 11, 21, 18, 0) # Evening time
    @is_holiday = true
    @weekday_discount = {monday: "monday", wednesday: "wednesday"}
    @weekday = {tuesday: "tuesday", thursday: "thursday", friday: "friday"}
  end

  def test_calculation_normal_adult
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(1000, result[:final_total], "Final total should be 1000 yen without discounts")
  end

  def test_calculation_normal_child
    tickets = [[1, 2, 1]] # One normal child ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(500, result[:base_total], "Base total should be 500 yen")
    assert_equal(500, result[:final_total], "Final total should be 500 yen without discounts")
  end

  def test_calculation_normal_senior
    tickets = [[1, 3, 1]] # One normal senior ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(800, result[:base_total], "Base total should be 800 yen")
    assert_equal(800, result[:final_total], "Final total should be 800 yen without discounts")
  end

  def test_calculation_special_adult
    tickets = [[2, 1, 1]] # One special adult ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(600, result[:base_total], "Base total should be 600 yen")
    assert_equal(600, result[:final_total], "Final total should be 600 yen without discounts")
  end

  def test_calculation_special_child
    tickets = [[2, 2, 1]] # One special child ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(400, result[:base_total], "Base total should be 400 yen")
    assert_equal(400, result[:final_total], "Final total should be 400 yen without discounts")
  end

  def test_calculation_special_senior
    tickets = [[2, 3, 1]] # One special senior ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(500, result[:base_total], "Base total should be 500 yen")
    assert_equal(500, result[:final_total], "Final total should be 500 yen without discounts")
  end

  def test_adult_group_discount_for_10
    tickets = [[1, 1, 10]] # Ten normal adult tickets
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(10000, result[:base_total], "Base total should be 10000 yen")
    assert_equal(9000, result[:final_total], "Final total should be 9000 yen with group discount")
  end

  def test_no_adult_group_discount_under_10
    tickets = [[1, 1, 9]] # Ten normal adult tickets
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(9000, result[:base_total], "Base total should be 9000 yen")
    assert_equal(9000, result[:final_total], "Final total should be 9000 yen with group discount")
  end

  def test_child_group_discount_for_20
    tickets = [[1, 2, 20]] # 20 normal child tickets
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(10000, result[:base_total], "Base total should be 10000 yen")
    assert_equal(9000, result[:final_total], "Final total should be 9000 yen with group discount")
  end

  def test_no_child_group_discount_under_20
    tickets = [[1, 2, 19]] # 19 normal child tickets
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(9500, result[:base_total], "Base total should be 9500 yen")
    assert_equal(9500, result[:final_total], "Final total should be 9500 yen with group discount")
  end

  def test_senior_group_discount_for_10
    tickets = [[1, 3, 10]] # Ten normal adult tickets
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(8000, result[:base_total], "Base total should be 8000 yen")
    assert_equal(7200, result[:final_total], "Final total should be 7200 yen with group discount")
  end

  def test_no_senior_group_discount_under_10
    tickets = [[1, 3, 9]] # Ten normal adult tickets
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(7200, result[:base_total], "Base total should be 7200 yen")
    assert_equal(7200, result[:final_total], "Final total should be 7200 yen with group discount")
  end

  def test_evening_discount
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(900, result[:final_total], "Final total should be 900 yen with evening discount")
  end

  def test_mon_discount
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday_discount[:monday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(900, result[:final_total], "Final total should be 900 yen with evening discount")
  end

  def test_wed_discount
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday_discount[:wednesday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(900, result[:final_total], "Final total should be 900 yen with evening discount")
  end

  def test_multiple_discount
    tickets = [[1, 1, 10]] # ten normal adult ticket
    calculator = Calculator.new(tickets, @time_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(10000, result[:base_total], "Base total should be 10000 yen")
    assert_equal(8000, result[:final_total], "Final total should be 1200 yen with holiday surcharge")
  end

  def test_holiday_surcharge
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_non_evening, @is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(1200, result[:final_total], "Final total should be 1200 yen with holiday surcharge")
  end

end
