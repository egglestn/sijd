# frozen_string_literal: true

class RecordsActivity < ApplicationRecord
  has_many :records
  has_many :activities

  validates :record_id, uniqueness: { scope: :activity_id }

  enum score: %i[
    much_worse
    a_bit_worse
    neutral
    a_bit_better
    much_better
  ]
end
