require 'csv'

puts "1(新規でメモを作成) 2(既存のメモを編集する)"
memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp

  puts "メモした内容を記入してください"
  puts "完了したら Ctrl + Dを押します"
  input_memo = STDIN.read
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv","w") do |csv|
    csv.puts ["#{memo}"]
  end
elsif memo_type == 2
  puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください"
  name = gets.chomp

  # 既存のファイルの内容を削除して新しい内容を書き込む
  puts "編集したい内容を入力してください"
  puts "終了後、Ctrl + Dを押します"
  input_memo = STDIN.read
  memo = input_memo.chomp

  CSV.open("#{name}.csv","w") do |csv|
    csv.puts ["#{memo}"]
  end
end