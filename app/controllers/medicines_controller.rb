# frozen_string_literal: true

class MedicinesController < ApplicationController
  def index
    @medicines = Medicine.all.includes(:records_medicines).order(:name)
    @records = Record.all.includes(:records_medicines).order(created_at: :desc).limit(30)
    medicines_map
  end

  private

  def medicines_map
    @positive_map = []
    @negative_map = []
    @medicines.each do |medicine|
      medicine_map(medicine)
    end
  end

  def medicine_map(medicine)
    pos = 0
    neg = 0
    RecordsMedicine.where(medicine_id: medicine.id).each do |ra|
      score = ra.score
      pos += 1 if %w[occasionally frequently].include? score
      neg -= 1 if score == "tried_but_stopped"
    end
    @positive_map << pos
    @negative_map << neg
  end
end
