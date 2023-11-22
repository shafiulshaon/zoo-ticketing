# output.rb
class OutputView
  def self.show_output(result)
    puts "\n計算結果：\n"
    puts "-"*10


    puts "\nチケット明細："
    puts "-"*42

    result[:ticket_details].each do |item|
      puts "#{translate_ticket_details(item[:type])}（#{translate_ticket_details(item[:category])}）: #{item[:quantity]} 人"
    end

    puts "-"*42



    puts "\n合計⾦額："
    puts "+" + "-"*42 + "+" + "-"*35 + "+"

    puts sprintf("| %-38s | %-31s |", "説明", "金額")
    puts "+" + "-"*42 + "+" + "-"*35 + "+"

    puts sprintf("| %-31s | %30s 円 |", "⾦額変更前合計⾦額", result[:base_total])
    puts sprintf("| %-34s | %30s 円 |", "販売合計⾦額", result[:final_total])

    puts "+" + "-"*42 + "+" + "-"*35 + "+"




    if result[:discount_details].any?
      puts "\n⾦額変更明細："
      puts "+" + "-"*42 + "+" + "-"*35 + "+"

      puts sprintf("| %-37s | %-30s |", "タイプ", "割引額")
      puts "+" + "-"*42 + "+" + "-"*35 + "+"

      result[:discount_details].each do |type, amount|
        puts sprintf("| %-36s | %30s 円 |", translate_discount_type(type), amount)
      end

      puts "+" + "-"*42 + "+" + "-"*35 + "+"
    end
  end

  private

  def self.translate_discount_type(type)
    case type
    when :group
      "団体割引"
    when :evening
      "⼣⽅料⾦"
    when :holiday
      "休⽇料⾦"
    when :weekday
      "⽉⽔割引"
    else
      "不明"
    end
  end

  def self.translate_ticket_details(value)
    case value
    when :normal
      "通常"
    when :special
      "特別"
    when :adult
      "大人"
    when :child
      "子供"
    when :senior
      "シニア"
    else
      "不明"
    end
  end
end
