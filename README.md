## Boris Bikes

A TDD Ruby application which simulates the Santander cycles system of London. Bikes, docking stations and users.



### Client's Requirements

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

### Functional Representation
```
Objects         | Messages
------------------------------
person          |
bike            | is_working (boolean)
docking station | release_bike
```



### Tech used
Ruby and RSpec



### Code example
```
require_relative 'bike'

class DockingStation
  attr_reader :bike
  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end
end
```



### Installation
```
$ git clone git@github.com:jdm79/boris-bikes.git
$ cd boris-bikes
```



### Tests
In the root folder, type:
```
$ rspec
```

### How to use
In a Ruby REPL such as IRB/Pry on your terminal, type:
```
> require './lib/docking_station.rb'
> require './lib/bike.rb'
> bike = Bike.new
> ds = DockingStation.new
```