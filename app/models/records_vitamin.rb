# frozen_string_literal: true

class RecordsVitamin < ApplicationRecord
  has_many :records
  has_many :vitamins

  validates :record_id, uniqueness: { scope: :vitamin_id }

  enum score: %i[
    tried_but_stopped
    occasionally
    frequently
    would_like_to
    not_tried
  ]
end
