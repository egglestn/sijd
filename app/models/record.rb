# frozen_string_literal: true

class Record < ApplicationRecord
  has_many :medicines_records, dependent: :destroy

  accepts_nested_attributes_for :medicines_records
end
