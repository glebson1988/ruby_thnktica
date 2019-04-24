class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    trains << train
  end

  def train_type(type)
    trains.select { |train| train.type == type }
  end

  def depart(train)
    trains.delete(train)
  end

  def stations_trains
    puts "Сейчас поездов на станции: #{trains.size}"
    trains.each.with_index(1) { |train, ind| puts "#{ind} - поезд № #{train.num}" } if trains.any?
  end

  def to_s
    "#{name}"
  end
end
