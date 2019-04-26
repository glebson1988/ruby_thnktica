class Route
  include InstanceCounter
  include Validation

  ROUTE_TYPE_ERROR = "Для создания маршрута необходимы объекты класса 'Station'."

  attr_reader :stations, :name

  def initialize(first, last)
    register_instance
    @stations = [first, last]
    validate!
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

  protected

  def validate!
    raise ROUTE_TYPE_ERROR unless stations.all? { |stn| stn.is_a? Station }
  end
end
