class TubeStation

  STATION_ZONES =  {
                cannon_street: 1,
                aldgate_east: 1
              }

  attr_reader :zone

  def initialize station
    @zone = STATION_ZONES[station]
  end

end
