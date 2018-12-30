require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
    
  def release_bike
    # Guard condition pattern
    # By catching errors is first priority, errors cannot progress further into program
    fail 'No bikes available' if empty?
    fail 'No bikes available' if broken?

    bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end

  def broken?
    bikes.last.broken?
  end
end
