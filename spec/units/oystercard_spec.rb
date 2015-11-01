require 'spec_helper'

describe 'Oystercard' do

  let(:oystercard) { Oystercard.new }

  context 'topping up' do
    it "card defaults with no money" do
      expect(oystercard.balance).to eq 0
    end

    it "tops up the balance" do
      oystercard.top_up(5)
      expect(oystercard.balance).to eq 5
    end

    it "doesn't top up over the maximum balance" do
      oystercard.top_up(45)
      expect { oystercard.top_up(10) }.to raise_error "Maximum balance is £50"
    end

  end

end
