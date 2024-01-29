require 'csv' # CSVファイルを扱うためのライブラリを読み込んでいる

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換している

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  # chompはgetsで取得した文字列から改行文字を除去できる
  
  puts "メモした内容を記入してください"
  puts "完了したら Ctrl + Dを押します"
  
  input_memo = STDIN.read # 全ての入力を一度で読み込む。複数行の入力を一度に処理することができる。
  memo = input_memo.chomp

  CSV.open("#{file_name}.csv","w") do |csv|
  csv.puts ["#{memo}"]
  end

elsif memo_type == 2

  puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください"
  name = gets.chomp

  require 'csv'

  memo_list = CSV.read("#{name}.csv")
  #CSV形式のファイルからデータを読み込むためのメソッド
  #{name}.csv は、文字列内で変数の値を展開するためのRubyの式

  p memo_list

  puts "編集したい内容を入力してください"
  puts "終了後、Ctrl + Dを押します"

  input_memo = STDIN.read # 全ての入力を一度で読み込む。複数行の入力を一度に処理することができる。
  memo = input_memo.chomp
  
  CSV.open("#{memo}.csv","a") do |csv| #引数の"a"は、ファイルを追記モードで開くことを示している。
  csv.puts ["#{memo}"]
  end
end



