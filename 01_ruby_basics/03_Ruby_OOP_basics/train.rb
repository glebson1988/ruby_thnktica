class Train
  attr_accessor :speed, :num, :type
  attr_reader :route

  def initialize(num, type, wagon_quant)
    @num = num
    @type = type
    @wagon_quant = wagon_quant
    @speed = 0
  end

  def racing(value)
    self.speed += value
  end

  def stop
    self.speed = 0
  end

  def hook_wagon
    @wagon_quant += 1 if speed.zero?
  end

  def unhook_wagon
    @wagon_quant -= 1 if speed.zero? && @wagon_quant.positive?
  end

  def receive_route(route)
    @route = route
    @station_index = 0
    current_station.arrive(self)
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
end
