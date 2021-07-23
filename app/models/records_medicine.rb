# frozen_string_literal: true

class RecordsMedicine < ApplicationRecord
  has_many :records
  has_many :medicines

  validates :record_id, uniqueness: { scope: :medicine_id }

  enum score: %i[
    tried_no_help
    occasionally
    frequently
    too_expensive
    not_tried
  ]
end
