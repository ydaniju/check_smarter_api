# frozen_string_literal: true
FactoryGirl.define do
  factory :checklist do
    title Faker::Name.first_name
    user_id user
  end
end
