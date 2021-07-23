# frozen_string_literal: true

class RecordsActivity < ApplicationRecord
  belongs_to :record
  belongs_to :activity

  validates :record_id, uniqueness: { scope: :activity_id }

  enum score: %i[
    much_worse
    a_bit_worse
    neutral
    a_bit_better
    much_better
  ]

  def to_s
    "#{activity.name} #{score.humanize}"
  end
end
