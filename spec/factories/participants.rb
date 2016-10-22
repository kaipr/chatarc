FactoryGirl.define do
  factory :participant do
    sequence(:name) { |n| "Participant #{n}" }
  end
end
