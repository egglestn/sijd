# frozen_string_literal: true

class Condition < ApplicationRecord
  has_many :records, dependent: :destroy
  accepts_nested_attributes_for :records

  validates :name, presence: true, uniqueness: true

  def to_s
    name
  end
end
