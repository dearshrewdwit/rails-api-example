FactoryBot.define do
  factory :player do
    trait :champion do
      name "Roger Federer"
      age  "36"
      prize_money 110235682
      titles 95
      grand_slams 19
    end
  end
end
