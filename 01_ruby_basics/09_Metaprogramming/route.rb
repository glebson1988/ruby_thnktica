class Route
  include InstanceCounter
  include Validation

  ROUTE_TYPE_ERROR = "Для маршрута необходимы объекты класса 'Station'.".freeze

  attr_reader :stations, :name

  def initialize(first, last)
    register_instance
    @stations = [first, last]
    @name = "#{first.name} - #{last.name}"
    validate!
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    return if [stations.first, stations.last].include?(station)

    stations.delete(station)
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
