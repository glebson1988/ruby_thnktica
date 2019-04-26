class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^[а-яa-z0-9]{3}(-)?[а-яa-z0-9]{2}$/i
  NUMBER_FORMAT_ERROR = 'Номер поезда указан в неверном формате.'
  NUMBER_UNIQUE_ERROR = 'Номер поезда должен быть уникальным.'

  attr_accessor :speed
  attr_reader :route, :wagons, :num, :type_wagon, :type

  @@trains = {}

  def self.find(train_num)
    @@trains[train_num]
  end

  def initialize(num)
    register_instance
    @type = type
    @num = num
    validate!
    @speed = 0
    @wagons = []
    @type_wagon = []
    @@trains[@num] = self
  end

  def up_speed(value)
    self.speed += value
  end

  def stop
    self.speed = 0
  end

  def hook_wagon(wagon)
    wagons << wagon if type_wagon.include?(wagon.type) && speed.zero?
  end

  def unhook_wagon
    wagons.pop if speed.zero?
  end

  def receive_route(route)
    @route = route
    @station_index = 0
    current_station.arrive(self)
  end

  def move_next
    return unless next_station

    current_station.depart(self)
    next_station.arrive(self)
    @station_index += 1
  end

  def move_back
    return unless prev_station

    current_station.depart(self)
    prev_station.arrive(self)
    @station_index -= 1
  end

  def current_station
    route.stations[@station_index]
  end

  def next_station
    route.stations[@station_index + 1]
  end

  def prev_station
    route.stations[@station_index - 1] if @station_index.positive?
  end

  def to_s
    "№: #{num}, тип: #{type}, кол-во вагонов: #{wagons.size}"
  end

  protected

  def validate!
    raise NUMBER_FORMAT_ERROR if num !~ NUMBER_FORMAT
    raise NUMBER_UNIQUE_ERROR if @@trains[num]
  end
end
