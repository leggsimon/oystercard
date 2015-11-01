class Oystercard

  PENALTY_FARE = 10
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

  def touch_in journey_start
    @journey = Journey.new(journey_start)
  end

  def touch_out journey_end
    if !@journey
      charge_penalty_fare
    else
      finalize_journey journey_end
    end
  end

  private

  def deduct_fare entry_zone, exit_zone
    @balance -= FARES["#{entry_zone} => #{exit_zone}"]
  end

  def charge_penalty_fare
    @balance -= PENALTY_FARE
  end

  def finalize_journey journey_end
    @journey.end_journey_at(journey_end)
    deduct_fare(@journey.start_point.zone, @journey.end_point.zone)
    @journey = nil
  end
end
