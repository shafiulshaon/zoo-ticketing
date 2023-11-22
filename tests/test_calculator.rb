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

  def test_basic_calculation
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:tuesday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(1000, result[:final_total], "Final total should be 1000 yen without discounts")
  end

  def test_evening_discount
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(900, result[:final_total], "Final total should be 900 yen with evening discount")
  end

  def test_group_discount
    tickets = [[1, 1, 10]] # Ten normal adult tickets
    calculator = Calculator.new(tickets, @time_non_evening, !@is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(10000, result[:base_total], "Base total should be 10000 yen")
    assert_equal(9000, result[:final_total], "Final total should be 9000 yen with group discount")
  end

  def test_holiday_surcharge
    tickets = [[1, 1, 1]] # One normal adult ticket
    calculator = Calculator.new(tickets, @time_non_evening, @is_holiday, @weekday[:friday])
    result = calculator.calculate
    assert_equal(1000, result[:base_total], "Base total should be 1000 yen")
    assert_equal(1200, result[:final_total], "Final total should be 1200 yen with holiday surcharge")
  end

end
