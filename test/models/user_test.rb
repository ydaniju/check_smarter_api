# frozen_string_literal: true
require "test_helper"

class UserTest < ActiveSupport::TestCase
  should validate_uniqueness_of :email

  should validate_presence_of :firstname

  should validate_presence_of :lastname

  should validate_presence_of :email

  should have_many :checklists
end
