class Journey
  attr_reader :start_point, :end_point

  def initialize(journey_start)
    @start_point = journey_start
  end

  def end_journey_at(journey_end)
    @end_point = journey_end
  end
end
