class CargoTrain < Train
  validate :num, :presence
  validate :num, :format, NUMBER_FORMAT

  def initialize(num)
    @type = 'грузовой'
    super
    @type_wagon = %i[cargo]
  end
end
