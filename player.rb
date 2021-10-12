class Player

  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def removeLive
    @lives -= 1
  end

end
