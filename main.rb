require_relative 'lib/wardrobe'
require_relative 'lib/clothes_item'

# загрузить вещи в гардероб
wardrobe = Wardrobe.take_from_dir("#{__dir__}/data")

puts "Сколько градусов за окном? (можно с минусом)"
temperature = STDIN.gets.to_i
puts

recommendation = wardrobe.create_outfit(temperature)

if recommendation.empty?
  puts "Нечего надеть, сидите дома"
else
  puts "Предлагаем сегодня надеть:"
  # вывод подборки вещей
  recommendation.each { |item| puts item }
end

puts
puts "Не нашли подходящих вещей в гардеробе?"
puts "Хотите добавить новую вещь? (Y/N)"
answer = STDIN.gets.chomp.capitalize
until answer == "Y" || answer == "N"
  puts "Y - да, N - нет"
  answer = STDIN.gets.chomp.capitalize
end

case answer
when "N"
  puts "Хорошего дня"
when "Y"
  puts "Введите наименование"
  name = STDIN.gets.chomp.capitalize
  puts "Введите категорию"
  category = STDIN.gets.chomp.capitalize
  puts "Введите диапазон температуры в формате:  \'(мин, макс)\'"
  temperature = STDIN.gets.chomp
  # записать файл с вещью
  wardrobe.add_new_item(name, category, temperature, __dir__)
  puts
  puts "вещь добавлена!"
  puts "Запустите программу снова для подбора одежды"
end
