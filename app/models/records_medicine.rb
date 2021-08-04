# frozen_string_literal: true

class RecordsMedicine < ApplicationRecord
  belongs_to :record
  belongs_to :medicine

  validates :record_id, uniqueness: { scope: :medicine_id }
  validates_presence_of(:score)

  enum score: %i[
    hate
    dislike
    neutral
    like
    love
  ]
end
