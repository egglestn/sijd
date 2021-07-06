# frozen_string_literal: true

class Thing < ApplicationRecord
  has_many :records_things, dependent: :destroy
  has_many :records, through: :records_things

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end
