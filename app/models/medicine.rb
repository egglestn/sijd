# frozen_string_literal: true

class Medicine < ApplicationRecord
  has_many :records_medicines, dependent: :destroy
  has_many :records, through: :records_medicines

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end
