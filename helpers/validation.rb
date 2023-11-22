# validation.rb
module Validation
  def self.validate_ticket_type(type)
    [1, 2].include?(type)
  end

  def self.validate_category(category)
    [1, 2, 3].include?(category)
  end

  def self.validate_quantity(quantity)
    quantity > 0
  end
end