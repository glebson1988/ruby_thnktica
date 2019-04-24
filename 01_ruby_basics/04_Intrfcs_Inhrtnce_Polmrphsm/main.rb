require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

class Main
  def initialize
    @routes = []
    @stations = []
    @trains = []
  end

  def main_flow
    loop do
      menu
      choice = gets.chomp.to_i
      break if choice.zero?

      case choice
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then control_route
      when 5 then assign_route
      when 6 then add_wagon
      when 7 then del_wagon
      when 8 then move_next_station
      when 9 then move_prev_station
      when 10 then show_list(stations)
      when 11 then show_stations_trains
      else
        puts 'Введите номер из списка'
      end
    end
  end

  def menu
    puts '=' * 80
    puts '0. Выйти из программы '
    puts '1. Создать станцию'
    puts '2. Создать поезд'
    puts '3. Создать маршрут'
    puts '4. Управлять маршрутом'
    puts '5. Привязать маршрут к поезду'
    puts '6. Прицепить вагон к поезду'
    puts '7. Отцепить вагон от поезда'
    puts '8. Переместить поезд на следующую станцию'
    puts '9. Переместить поезд на предыдущую станцию'
    puts '10. Просмотреть список станций'
    puts '11. Просмотреть список поездов на станции'
    puts '=' * 80
  end

  private # доступ в классе, нет наследования

  attr_reader :stations, :trains, :routes

  def show_list(list)
    list.each.with_index(1) do |item, index|
      puts "#{index}: #{item.to_s}"
    end
  end

  def select_from_list(list)
    i = gets.to_i
    return unless i > 0

    list[i - 1]
  end

  def create_station
    puts 'Введите название станции: '
    name = gets.chomp
    stations << Station.new(name)
    show_list(stations)
  end

  def create_train
    puts 'Какой поезд создать?'
    puts '1 - грузовой, 2 - пассажирский'
    type = gets.chomp
    puts 'Присвойте поезду номер: '
    num = gets.chomp
    case type
    when '1' then trains << CargoTrain.new(num)
    when '2' then trains << PassengerTrain.new(num)
    end
    show_list(trains)
  end

  def create_route
    show_list(stations)
    puts 'Выберите начальную станцию маршрута(номер из списка): '
    start = select_from_list(stations)
    puts 'Выберите начальную станцию маршрута(номер из списка): '
    finish = select_from_list(stations)
    return if start.nil? || finish.nil?
    return if start == finish

    routes << Route.new(start, finish)
    puts 'Маршрут построен'
    show_list(routes)
  end

  def control_route
    puts 'Выберите маршрут: '
    show_list(routes)
    route = select_from_list(routes)
    puts "Выбран маршрут #{route.name}"
    puts '1 - добавить станцию, 2 - удалить станцию'
    case gets.chomp.to_i
    when 1 then
      add_route_station(route)
    when 2 then
      remove_route_station(route)
    end
  end

  def add_route_station(route)
    puts 'Какую станцию добавить в маршрут?'
    show_list(stations)
    station = select_from_list(stations)
    return if station.nil?

    route.add_station(station)
    puts 'Станция добавлена в маршрут'
  end

  def remove_route_station(route)
    puts 'Какую станцию удалить из маршрута?'
    show_list(route.stations)
    station = select_from_list(stations)
    return if station.nil?

    route.remove_station(station)
    puts 'Станция удалена из маршрута'
  end

  def assign_route
    puts 'Выберите поезд: '
    show_list(trains)
    train = select_from_list(trains)
    puts 'Выберите маршрут: '
    show_list(routes)
    route = select_from_list(routes)
    return if route.nil?

    train.receive_route(route)
    puts "Маршрут для поезда #{train.num} построен"
  end

  def add_wagon
    puts 'Выберите поезд: '
    show_list(trains)
    train = select_from_list(trains)
    wagon_type = case train
                 when PassengerTrain then PassengerWagon
                 when CargoTrain then CargoWagon
                 end
    train.hook_wagon(wagon_type.new)
    puts "К поезду #{train.num} добавлен вагон"
  end

  def del_wagon
    puts 'Выберите поезд: '
    show_list(trains)
    train = select_from_list(trains)
    train.unhook_wagon
    puts "С поезда #{train.num} отцеплен вагон "
  end

  def move_next_station
    puts 'Выберите поезд: '
    show_list(trains)
    train = select_from_list(trains)
    train.move_next
    puts "Поезд переместился на станцию #{train.current_station.name}"
  end

  def move_prev_station
    puts 'Выберите поезд: '
    show_list(trains)
    train = select_from_list(trains)
    train.move_back
    puts "Поезд переместился на станцию #{train.current_station.name}"
  end

  def show_stations_trains
    puts 'Выберите станцию: '
    show_list(stations)
    station = select_from_list(stations)
    station.stations_trains
  end
end

Main.new.main_flow