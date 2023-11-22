class Ticket
  PRICES = {
    normal: { adult: 1000, child: 500, senior: 800 },
    special: { adult: 600, child: 400, senior: 500 }
  }

  TYPE_CODES = {
    1 => :normal,
    2 => :special
  }

  CATEGORY_CODES = {
    1 => :adult,
    2 => :child,
    3 => :senior
  }

  def self.price(type_code, category_code)
    type = TYPE_CODES[type_code]
    category = CATEGORY_CODES[category_code]
    return nil unless type && category

    PRICES[type][category]
  end

  def self.ticket_details(type_code, category_code, quantity)
    {
      type: TYPE_CODES[type_code],
      category: CATEGORY_CODES[category_code],
      quantity: quantity
    }
  end

end