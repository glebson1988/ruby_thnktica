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

  def to_s
    "#{name}"
  end

  def each_train
    trains.each { |train| yield(train) }
  end

  protected

  def validate!
    raise EMPTY_NAME_ERROR if name == ''
    raise LONG_NAME_ERROR if name.length > 10
  end
end
