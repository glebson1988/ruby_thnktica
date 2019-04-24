class Route
  # получаем список станций через геттер
  attr_reader :stations, :name

  def initialize(first, last)
    @stations = [first, last]
    # маршрут: начальная - конечная
    @name = "#{first.name} - #{last.name}"
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    stations.delete(station) unless [stations.first, stations.last].include?(station)
  end

  def show_stations
    stations.each { |station| puts station.name }
  end

  def to_s
    name
  end
end
