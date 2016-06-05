# frozen_string_literal: true
class User < ApplicationRecord
  has_many :checklists

  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: true
end
