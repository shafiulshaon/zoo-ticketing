# main_controller.rb
require_relative 'input'
require_relative '../models/ticket'
require_relative '../models/discount'
require_relative '../models/calculator'
require_relative '../views/output'

class MainController
  def self.run
    puts "動物園チケット販売計算へようこそ！"

    loop do
      input_data = InputController.get_input

      result = Calculator.new(
        input_data[:tickets],
        input_data[:time],
        input_data[:is_holiday],
        input_data[:day]
      ).calculate

      OutputView.show_output(result)

      puts "プログラムを終了するには「q」を押してください。続けるには他のキーを押してください。"
      break if gets.chomp.downcase == 'q'
    end

    puts "\n動物園チケット販売計算をご利用いただき、ありがとうございました！"
  end
end
