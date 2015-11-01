require 'spec_helper'

describe 'Journey' do
  it 'knows where the journey started' do
    cannon_street = double(:cannon_street)
    journey = Journey.new(cannon_street)
    expect(journey.start_point).to eq cannon_street
  end

  it 'knows where the journey ends' do
    cannon_street = double(:cannon_street)
    aldgate_east  = double(:aldgate_east)
    journey = Journey.new(cannon_street)
    journey.end_journey_at(aldgate_east)
    expect(journey.end_point).to eq aldgate_east
  end
end
