# input_controller.rb
require_relative '../helpers/helper'
require_relative '../helpers/validation'

class InputController
  def self.get_input
    tickets = get_ticket_info

    current_time, current_date = set_current_date_time
    is_holiday = holiday?(current_date.strftime("%A").downcase)

    { tickets: tickets, time: current_time, is_holiday: is_holiday, day: current_date.strftime("%A").downcase }
  end
end
