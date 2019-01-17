# Boris Bikes

A program to help manage the Boris Bike system.

## Getting Started

Clone this repo: `git clone https://github.com/BillMux/BorisBikes.git`

Start IRB: `irb`

Load the docking station: `load 'lib/docking_station.rb'`

Create a new instance of docking station class: `station = DockingStation.new`

You now have a Boris Bike docking station to play with! It currently has zero bikes docked, and has a capacity of 20.

You can dock a bike: `station.dock(Bike.new)` (this will be a working bike by default)

And release a bike: `station.release` (provided there are working bikes in the station)
