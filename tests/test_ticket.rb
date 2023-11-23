require 'test/unit'
require_relative '../models/ticket'

class TestTicket < Test::Unit::TestCase
  # Testing normal ticket prices
  def test_normal_adult_price
    assert_equal(1000, Ticket.price(1, 1), "通常の大人料金は1000円となる。")
  end

  def test_normal_child_price
    assert_equal(500, Ticket.price(1, 2), "通常の子供料金は500円となる")
  end

  def test_normal_senior_price
    assert_equal(800, Ticket.price(1, 3), "通常のシニア料金は800円となる")
  end

  # Testing special ticket prices
  def test_special_adult_price
    assert_equal(600, Ticket.price(2, 1), "特別な大人料金は600円となる")
  end

  def test_special_child_price
    assert_equal(400, Ticket.price(2, 2), "特別な子供料金は400円となる")
  end

  def test_special_senior_price
    assert_equal(500, Ticket.price(2, 3), "特別なシニア料金は500円となる")
  end

  # Testing invalid inputs
  def test_invalid_ticket_type
    assert_nil(Ticket.price(3, 1), "無効なチケットタイプはnilを返す。")
  end

  def test_invalid_category
    assert_nil(Ticket.price(1, 4), "無効なカテゴリータイプはnilを返す。")
  end
end
