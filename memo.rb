require 'csv' # CSVファイルを扱うためのライブラリを読み込んでいる

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換している

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  # getsで取得した文字列から改行文字を除去できる
  
  puts "メモした内容を記入してください"
  puts "完了したら Ctrl + Dをおします"
  
  input_memo = STDIN.read
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv","w") do |csv|
  csv.puts ["#{memo}"]
  end
end



