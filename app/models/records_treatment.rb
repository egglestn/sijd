# frozen_string_literal: true

class RecordsTreatment < ApplicationRecord
  belongs_to :record
  belongs_to :treatment

  validates :record_id, uniqueness: { scope: :treatment_id }
  validates_presence_of(:score)

  enum score: %i[
    not_tried
    once
    several_times
    would_like_to
    not_again
  ]
end
