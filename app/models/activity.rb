# frozen_string_literal: true

class Activity < ApplicationRecord
  has_many :records_activities, dependent: :destroy
  has_many :records, through: :records_activities

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end
