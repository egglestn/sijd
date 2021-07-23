# frozen_string_literal: true

class Vitamin < ApplicationRecord
  has_many :records_vitamins, dependent: :destroy
  has_many :records, through: :records_vitamins

  validates :name, presence: true, uniqueness: true
  delegate :to_s, to: :name
end
