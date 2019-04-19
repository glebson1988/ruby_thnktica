class Route
  # получаем список станций через геттер
  attr_reader :stations

  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station) if stations.include?(station)
  end
end
