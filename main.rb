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
