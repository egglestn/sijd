# frozen_string_literal: true

class TreatmentsController < ApplicationController
  def index
    @treatments = Treatment.all.order(:name)
    @records = Record.all.includes(:records_treatments).order(created_at: :desc).limit(30)
    treatments_map
  end

  private

  def treatments_map
    @positive_map = []
    @negative_map = []
    @treatments.each do |treatment|
      treatment_map(treatment)
    end
  end

  def treatment_map(treatment)
    pos = 0
    neg = 0
    RecordsTreatment.where(treatment_id: treatment.id).each do |ra|
      score = ra.score
      pos += 1 if %w[permanent_success successful_but_wears_off].include? score
      neg -= 1 if score == "did_not_help"
    end
    @positive_map << pos
    @negative_map << neg
  end
end
