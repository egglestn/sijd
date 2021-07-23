# frozen_string_literal: true

class RecordsMedicine < ApplicationRecord
  has_many :records
  has_many :medicines

  validates :record_id, uniqueness: { scope: :medicine_id }

  enum score: %i[
    tried_but_stopped
    occasionally
    frequently
    would_like_to
    not_tried
  ]
end
