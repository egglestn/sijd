# frozen_string_literal: true

class RecordsThing < ApplicationRecord
  has_many :records
  has_many :things

  validates :record_id, uniqueness: { scope: :thing_id }

  enum score: %i[
    much_worse
    a_bit_worse
    neutral
    a_bit_better
    much_better
  ]
end
