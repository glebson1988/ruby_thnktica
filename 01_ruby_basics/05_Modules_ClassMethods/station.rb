class Station
  include InstanceCounter

  attr_reader :trains, :name

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    register_instance
    @name = name
    @trains = []
    @@all_stations << self
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
