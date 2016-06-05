# frozen_string_literal: true
class Checklist < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
end
