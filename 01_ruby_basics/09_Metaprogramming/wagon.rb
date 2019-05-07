class Wagon
  include Manufacturer

  NOT_ENOUGH_SPACE = 'Недостаточно места.'.freeze

  attr_reader :num, :space
  attr_accessor :reserved_space

  @@wagon_num = 0

  def initialize(space)
    @num = @@wagon_num += 1
    @space = space
    @reserved_space = 0
  end

  def free_space
    space - reserved_space
  end

  def reserve_space(amount)
    raise NOT_ENOUGH_SPACE if amount > free_space

    self.reserved_space += amount
  end

  def to_s
    puts "Вагон: #{num}, занято: #{reserved_space}, свободно: #{free_space}."
  end
end
