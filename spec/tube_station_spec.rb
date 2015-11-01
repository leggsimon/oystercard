require 'spec_helper'

describe 'Tube station' do
  it "knows it's zone" do
    cannon_street = TubeStation.new(:cannon_street)
    expect(cannon_street.zone).to eq 1
  end
end
