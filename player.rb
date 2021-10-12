class Player

  attr_accessor :lives

  def initialize()
    @lives = 3
  end

  protected

  def removeLive
    @lives -= 1
  end

end
