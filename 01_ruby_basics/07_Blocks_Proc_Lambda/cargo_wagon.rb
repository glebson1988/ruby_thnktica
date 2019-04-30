class CargoWagon < Wagon
  attr_reader :type

  def initialize(space)
    @type = :cargo
    super
  end
end
