# frozen_string_literal: true

class RecordsMedicine < ApplicationRecord
  belongs_to :record
  belongs_to :medicine

  validates :record_id, uniqueness: { scope: :medicine_id }

  enum score: %i[
    tried_but_stopped
    occasionally
    frequently
    would_like_to
    not_tried
  ]
end
