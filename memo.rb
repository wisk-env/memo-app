require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
# p memo_type

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1 then
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp!
  new_file_name = file_name + ".csv"
# p new_file_name

  p "メモしたい内容を記入してください"
  p "完了したらCtrl + Dを押します"

  input_text = $stdin.read
# p input_text
  CSV.open(new_file_name, 'w') do |csv|
    csv << ["#{input_text}"]
  end

elsif memo_type == 2 then
  puts "拡張子を除いた既存のファイルを入力してください"
  file_name = gets.chomp!
  update_file_name = file_name + ".csv"
# p update_file_name

  p "メモしたい内容を記入してください"
  p "完了したらCtrl + Dを押します"

  input_text = $stdin.read
# p input_text
# p ["#{input_text}"]

  CSV.open(update_file_name, 'a') do |csv|
    csv << ["#{input_text}"]
  end
end