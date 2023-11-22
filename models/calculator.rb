class Calculator
  def initialize(tickets, time, is_holiday, day)
    @tickets = tickets # Array of [type, category, quantity] for each ticket
    @time = time
    @is_holiday = is_holiday
    @day = day
    @discount_details = {
      group: 0,
      evening: 0,
      holiday: 0,
      weekday: 0,
    }
    @ticket_details = []
  end

  def calculate
    base_total = 0
    final_total = 0
    group_people_count = 0

    @tickets.each do |type, category, quantity|
      base_price = Ticket.price(type, category)
      discount = apply_discounts(quantity)
      price = base_price - discount

      base_total += base_price * quantity
      final_total += price * quantity
      # ticket_details << Ticket.ticket_details(type, category, quantity)
      set_ticket_details(type, category, quantity)
      group_people_count += category == 2 ?  quantity/2 : quantity  # ⼦供は0.5⼈換算とする
    end

    final_total = include_group_discount(base_total, final_total, group_people_count)

    {
      base_total: base_total,
      final_total: final_total,
      discount_details: @discount_details,
      ticket_details: @ticket_details
    }
  end

  private

  def apply_discounts(quantity)
    discount = 0

    evening_discount = Discount.evening_discount(@time)
    if evening_discount > 0
      discount += evening_discount
      @discount_details[:evening] -= evening_discount * quantity
    end

    holiday_surcharge = Discount.holiday_surcharge(@is_holiday)
    if holiday_surcharge < 0
      discount += holiday_surcharge
      @discount_details[:holiday] -= holiday_surcharge * quantity
    end

    weekday_discount = Discount.weekday_discount(@day)
    if weekday_discount > 0
      discount += weekday_discount
      @discount_details[:weekday] -= weekday_discount * quantity
    end

    discount
  end

  def include_group_discount(base_total, final_total, quantity)
    group_discount = Discount.group_discount(base_total, quantity)
    if group_discount > 0
      final_total = final_total - group_discount
      @discount_details[:group] -= group_discount
    end
    final_total
  end

  def set_ticket_details(type, category, quantity)
    ticket_data = Ticket.ticket_details(type, category, quantity)
    existing_entry = @ticket_details.find { |t| t[:type] == ticket_data[:type] && t[:category] == ticket_data[:category] }
    if existing_entry
      existing_entry[:quantity] += quantity
    else
      @ticket_details << ticket_data
    end
  end

end