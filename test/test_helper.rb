# frozen_string_literal: true
require "coveralls"
Coveralls.wear!

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "test_utility"

module ActiveSupport
  class TestCase
    include FactoryGirl::Syntax::Methods
    include TestUtility
  end
end
