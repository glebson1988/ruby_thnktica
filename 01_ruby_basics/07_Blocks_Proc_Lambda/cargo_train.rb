class CargoTrain < Train
  def initialize(num)
    @type = 'грузовой'
    super
    @type_wagon = %i[cargo]
  end
end
