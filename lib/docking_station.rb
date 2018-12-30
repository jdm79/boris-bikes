require_relative 'bike'

class DockingStation
  attr_reader :bike
 
  def release_bike
    # Guard condition pattern
    # By catching errors is first priority, errors cannot progress further into program
    fail 'No bikes available' unless @bike
    @bike
  end

  def dock(bike)
    fail 'Docking station full' if @bike
    @bike = bike
  end
end
