require 'rails_helper'

RSpec.describe Player, type: :model do

  it 'is a valid record' do
    player = build(:player, :champion)
    expect(player).to be_valid
  end

  context 'is not a valid record' do
    %i(name age prize_money grand_slams).each do |property|
      it "#{property} can't be blank" do
        player = build(:player, :champion)
        player.update_attribute(property, '')
        expect(player).not_to be_valid
      end
    end
  end
end
