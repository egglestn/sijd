# frozen_string_literal: true

class RecordsTreatment < ApplicationRecord
  has_many :records
  has_many :treatments

  validates :record_id, uniqueness: { scope: :treatment_id }

  enum score: %i[
    not_tried
    once
    several_times
    would_like_to
    not_again
  ]
end
