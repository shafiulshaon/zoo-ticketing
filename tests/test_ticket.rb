require 'test/unit'
require_relative '../models/ticket'

class TestTicket < Test::Unit::TestCase
  # Testing normal ticket prices
  def test_normal_adult_price
    assert_equal(1000, Ticket.price(1, 1), "Normal adult price should be 1000 yen")
  end

  def test_normal_child_price
    assert_equal(500, Ticket.price(1, 2), "Normal child price should be 500 yen")
  end

  def test_normal_senior_price
    assert_equal(800, Ticket.price(1, 3), "Normal senior price should be 800 yen")
  end

  # Testing special ticket prices
  def test_special_adult_price
    assert_equal(600, Ticket.price(2, 1), "Special adult price should be 600 yen")
  end

  def test_special_child_price
    assert_equal(400, Ticket.price(2, 2), "Special child price should be 400 yen")
  end

  def test_special_senior_price
    assert_equal(500, Ticket.price(2, 3), "Special senior price should be 500 yen")
  end

  # Testing invalid inputs
  def test_invalid_ticket_type
    assert_nil(Ticket.price(3, 1), "Invalid ticket type should return nil")
  end

  def test_invalid_category
    assert_nil(Ticket.price(1, 4), "Invalid category type should return nil")
  end
end
