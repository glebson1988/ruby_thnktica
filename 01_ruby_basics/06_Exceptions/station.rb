class Station
  include InstanceCounter
  include Validation

  EMPTY_NAME_ERROR = 'Название не может быть пустым.'
  LONG_NAME_ERROR = 'Название слишком длинное.'

  attr_reader :trains, :name

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    register_instance
    @name = name
    validate!
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

  protected

  def validate!
    raise EMPTY_NAME_ERROR if name == ''
    raise LONG_NAME_ERROR if name.length > 10
  end
end
