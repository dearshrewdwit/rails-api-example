FactoryBot.define do
  factory :player do
    trait :champion do
      name "Roger Federer"
      age  "36"
      prize_money 110235682
      grand_slams 19
      
      after(:create) do |player, evaluator|
        create_list(:title, 1, player: player)
      end
    end
  end
end
