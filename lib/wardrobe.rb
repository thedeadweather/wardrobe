class Wardrobe
  # заполнить гардероб
  def self.take_from_dir(file_path)
    clothes =
      Dir["#{file_path}/*.txt"].
        map do |path|
          item = File.readlines(path, chomp: true)
          temp_range = item[2].gsub(/[^+\-\d ]/, '')
          ClothesItem.new(
            item[0],
            item[1],
            min: temp_range.split.first.to_i,
            max: temp_range.split.last.to_i
          )
        end
    new(clothes)
  end

  # добавить новую одежду в гардероб
  def self.add_new_item(item, path)
    File.open("#{path}/data/added_item_#{Time.now.strftime("%j-%Y_%H:%M:%S")}.txt", 'w:UTF-8') do |file|
      file.puts("#{item.name}")
      file.puts("#{item.category}")
      file.puts("#{item.min_temp}, #{item.max_temp}")
    end
  end

  # гардероб со всей одеждой
  def initialize(all_clothes = [])
    @all_clothes = all_clothes
  end

  # подобрать коллекцию вещей
  def create_outfit(temperature)
    appropriated!(temperature)
    item_types.map { |i| same_type_items(i).sample }
  end


  private

  # типы вещей
  def item_types
    @all_clothes.map(&:category).uniq
  end

  # одежда одного типа
  def same_type_items(type)
    @all_clothes.select { |i| i.category == type }
  end

  # одежда, подходящая по погоде
  def appropriated!(temperature)
    @all_clothes.select! { |i| i.match_weather?(temperature) }
  end
end
