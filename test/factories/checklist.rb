# frozen_string_literal: true
FactoryGirl.define do
  factory :checklist do
    title Faker::Name.first_name
    comments
    votes
  end
end
