class Station
  include InstanceCounter
  include Validation
  include Accessors

  attr_reader :trains, :name
  attr_accessor_with_history :name
  strong_attr_accessor :category, String

  validate :name, :presence
  validate :name, :type, String

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @category = 'Сортировочная'
    @@all_stations << self
    validate!
    register_instance
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
    name
  end

  def each_train
    trains.each { |train| yield(train) }
  end
end
