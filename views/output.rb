class OutputView
  BORDER = "-" * 42
  HEADER_BORDER = "+" + "-" * 42 + "+" + "-" * 35 + "+"
  HEADER_FORMAT = "| %-38s | %-31s |"

  def self.show_output(result)
    print_section_header("計算結果：")
    print_ticket_details(result[:ticket_details])
    print_total_amount(result)
    print_discount_details(result[:discount_details]) if result[:discount_details].any?
  end

  private

  def self.print_section_header(title)
    puts "\n#{title}\n#{"-"*10}"
  end

  def self.print_ticket_details(ticket_details)
    puts "\nチケット明細："
    puts BORDER
    ticket_details.each do |item|
      puts "#{translate_ticket_details(item[:type])}（#{translate_ticket_details(item[:category])}）: #{item[:quantity]} 人"
    end
    puts BORDER
  end

  def self.print_total_amount(result)
    puts "\n合計⾦額："
    puts HEADER_BORDER
    puts sprintf(HEADER_FORMAT, "説明", "金額")
    puts HEADER_BORDER
    puts sprintf("| %-31s | %30s 円 |", "⾦額変更前合計⾦額", result[:base_total])
    puts sprintf("| %-34s | %30s 円 |", "販売合計⾦額", result[:final_total])
    puts HEADER_BORDER
  end

  def self.print_discount_details(discount_details)
    puts "\n⾦額変更明細："
    puts HEADER_BORDER
    puts sprintf("| %-37s | %-30s |", "タイプ", "割引額")
    puts HEADER_BORDER
    discount_details.each do |type, amount|
      puts sprintf("| %-36s | %30s 円 |", translate_discount_type(type), amount)
    end
    puts HEADER_BORDER
  end

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
