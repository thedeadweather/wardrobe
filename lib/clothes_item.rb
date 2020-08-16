class ClothesItem
  attr_reader :name, :category, :min_temp, :max_temp

  def initialize(name, category, temperature = {})
    @name = name
    @category = category
    @min_temp = temperature[:min]
    @max_temp = temperature[:max]
  end

  # соответсвовать погоде
  def match_weather?(temperature)
    temperature.between?(min_temp, max_temp)
  end

  def to_s
    "#{name} (#{category}) #{min_temp}..#{max_temp}"
  end
end
