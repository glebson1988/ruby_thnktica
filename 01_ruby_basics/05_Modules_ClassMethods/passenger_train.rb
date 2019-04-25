class PassengerTrain < Train
  def initialize(num)
    @type = 'пассажирский'
    super
    @type_wagon = %i[passenger]
  end
end
