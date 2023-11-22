require 'time'
require 'date'
HOLIDAY_SURCHARGE = %w(saturday sunday).freeze

# ユーザーからチケット情報を取得する関数
def get_ticket_info
  tickets = []

  loop do
    type = nil
    category = nil
    quantity = nil

    # チケットの種類の入力
    loop do
      puts "チケットのタイプを入力してください（通常：1／特別：2）:"
      type = gets.chomp.to_i
      if Validation.validate_ticket_type(type)
        break
      else
        puts "無効なチケットの種類です。'通常：1' または '特別：2' を入力してください。"
      end
    end

    # カテゴリーの入力
    loop do
      puts "カテゴリーを入力してください（大人：1／子供：2／シニア：3）:"
      category = gets.chomp.to_i
      if Validation.validate_category(category)
        break
      else
        puts "無効なカテゴリーです。'大人：1'、'子供：2'、または 'シニア：3' を入力してください。"
      end
    end

    # 数量の入力
    loop do
      puts "数量を入力してください："
      quantity = gets.chomp.to_i
      if Validation.validate_quantity(quantity)
        break
      else
        puts "無効な数量です。正の数を入力してください。"
      end
    end

    tickets << [type, category, quantity]

    puts "このチケットにもう1つのタイプを追加しますか？（はい：y／いいえ：他のキー）"
    break unless gets.chomp.downcase == 'y'
  end

  tickets
end

# 休日かどうかの設定
def holiday?(day)
  return true if HOLIDAY_SURCHARGE.include?(day)

  puts "今日は休日ですか？（はい：y／いいえ：他のキー）"
  gets.chomp.strip.downcase == 'y'
end

# 現在の日時をJST（日本標準時）に設定
def set_current_date_time
  ENV['TZ'] = 'Asia/Tokyo'
  [Time.now, Date.today]
end