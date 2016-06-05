# frozen_string_literal: true
require "test_helper"

class ChecklistTest < ActiveSupport::TestCase
  should validate_presence_of :title

  should validate_length_of(:title).is_at_least 3

  should belong_to :user
end
