class TubeStation

  STATION_ZONES =  {
                cannon_street: 1,
                aldgate_east: 1
              }

  attr_reader :zone

  def initialize station
    fail "This station doesn't exist!" if !STATION_ZONES.include? station
    @zone = STATION_ZONES[station]
  end

end
