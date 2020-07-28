# encoding: utf-8
#
# Популярная детская игра
# https://ru.wikipedia.org/wiki/Виселица_(игра)
#
# Этот код необходим только при использовании русских букв на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = "./" + File.dirname(__FILE__)

require current_path + "/game.rb"
require current_path + "/result_printer.rb"
require current_path + "/word_reader.rb"

printer = ResultPrinter.new
reader = WordReader.new

puts "Игра виселица. Версия 3.\n\n"
sleep 1

slovo = reader.read_from_file(current_path + '/data/words.txt')

game = Game.new(slovo)

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)

