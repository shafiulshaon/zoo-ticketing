module Discount
  WEEKDAY_DISCOUNT = %w(monday wednesday).freeze

  def self.group_discount(base_total, number_of_people)
    number_of_people >= 10 ? (base_total * 0.1).to_i : 0
  end

  def self.evening_discount(time)
    time.hour >= 17 ? 100 : 0
  end

  def self.holiday_surcharge(is_holiday)
    is_holiday ? -200 : 0
  end

  def self.weekday_discount(day)
    WEEKDAY_DISCOUNT.include?(day.downcase) ? 100 : 0
  end
end