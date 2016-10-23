FactoryGirl.define do
  trait :with_messages do
    after(:create) do |conversation|
      create_list :message, 2, conversation: conversation
    end
  end

  factory :conversation do
    title "Some conversation"
    note "Some note"
  end
end
