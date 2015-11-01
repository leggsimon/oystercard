require 'spec_helper'

describe 'Oystercard' do
  let(:oystercard) { Oystercard.new }

  context 'topping up' do
    it 'card defaults with no money' do
      expect(oystercard.balance).to eq 0
    end

    it 'tops up the balance' do
      oystercard.top_up(5)
      expect(oystercard.balance).to eq 5
    end

    it "doesn't top up over the maximum balance" do
      oystercard.top_up(45)
      expect { oystercard.top_up(10) }.to raise_error 'Maximum balance is £50'
    end
  end

  context 'touching in/out' do
    it "charges penalty fare if 'touching out' before 'touching in'" do
      cannon_street = double(:cannon_street)
      oystercard.top_up(10)
      oystercard.touch_out cannon_street
      expect(oystercard.balance).to eq 0
    end

    it "'touching in' creates a new journey" do
      cannon_street = double(:cannon_street)
      expect(Journey).to receive(:new).with(cannon_street)
      oystercard.touch_in cannon_street
    end

    it "'touching out' charges a fare" do
      cannon_street = double(:cannon_street, zone: 1)
      aldgate_east  = double(:aldgate_east, zone: 1)
      oystercard.top_up(10)
      oystercard.touch_in cannon_street
      oystercard.touch_out aldgate_east
      expect(oystercard.balance).to eq 8
    end
  end
end
