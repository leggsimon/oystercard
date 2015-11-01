require "json"

class TubeStation
  STATION_ZONES = JSON.parse(File.read("./tube_stations.json"))


  attr_reader :zone

  def initialize(station)
    fail "This station doesn't exist!" unless STATION_ZONES.include? station.to_s
    @zone = STATION_ZONES[station.to_s]["zone"]
  end
end
