# frozen_string_literal: true

class Treatment < ApplicationRecord
  has_many :records_treatments, dependent: :destroy
  has_many :records, through: :records_treatments

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end
