class Oystercard

  MAXIMUM_BALANCE = 50
  FARES = {
            "1 => 1" => 2,
            "1 => 2" => 3,
            "1 => 3" => 4,
            "1 => 4" => 5,
            "1 => 5" => 6,
            "1 => 6" => 7
          }

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up amount
    fail "Maximum balance is £50" if balance + amount > MAXIMUM_BALANCE
    @balance = amount + balance
  end

  def touch_in station
    @entry_station = station
  end

  def touch_out station
    @exit_station = station
    deduct_fare(@entry_station.zone, @exit_station.zone)
  end

  private

  def deduct_fare entry_zone, exit_zone
    @balance -= FARES["#{entry_zone} => #{exit_zone}"]
  end
end
