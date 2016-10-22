FactoryGirl.define do
  factory :channel do
    sequence(:name) { |n| "Channel #{n}" }
  end
end
