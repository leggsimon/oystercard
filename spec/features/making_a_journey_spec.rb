require 'spec_helper'

feature 'Making a journey' do
  scenario 'deducts money from the card' do
    oystercard = Oystercard.new
    cannon_street = TubeStation.new(:cannon_street)
    aldgate_east  = TubeStation.new(:aldgate_east)
    oystercard.top_up 10
    oystercard.touch_in cannon_street
    oystercard.touch_out aldgate_east
    expect(oystercard.balance).to eq 8
  end

end
