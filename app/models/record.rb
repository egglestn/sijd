# frozen_string_literal: true

class Record < ApplicationRecord
  has_many :medicines_records, dependent: :destroy
  has_many :records_activities, dependent: :destroy
  has_many :records_vitamins, dependent: :destroy
  has_many :records_medicines, dependent: :destroy
  has_many :records_treatments, dependent: :destroy

  accepts_nested_attributes_for :records_activities

  enum side: %i[
    both
    left
    right
    left_more_than_right
    right_more_than_left
  ]

  enum spreads: %i[
    sciatic_nerve
    glutes
    pyriformis
    hips
    pelvis
    lower_back
  ]

  accepts_nested_attributes_for :medicines_records
end
