class PassengerWagon < Wagon
  attr_reader :type

  def initialize(space)
    @type = :passenger
    super
  end

  def reserve_space
    super(1)
  end
end
