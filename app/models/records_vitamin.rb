# frozen_string_literal: true

class RecordsVitamin < ApplicationRecord
  belongs_to :record
  belongs_to :vitamin

  validates :record_id, uniqueness: { scope: :vitamin_id }

  enum score: %i[
    tried_but_stopped
    occasionally
    frequently
    would_like_to
    not_tried
  ]
end
