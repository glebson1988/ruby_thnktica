class PassengerTrain < Train
  validate :num, :presence
  validate :num, :format, NUMBER_FORMAT

  def initialize(num)
    @type = 'пассажирский'
    super
    @type_wagon = %i[passenger]
  end
end
